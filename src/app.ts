import express from 'express';
import mysql, { RowDataPacket } from 'mysql2/promise';
import fs from 'fs';
import cors from 'cors';
import http from 'http';
import https from 'https';

// read config
const configJSONString = fs.readFileSync('config.json', 'utf-8');
const config = JSON.parse(configJSONString);

// read config values
const backend_port = config.backend_port;
const frontend_url = config.frontend_url;
const useHttps = config.useHttps;

// create cors config object
const corsConfig = {
  origin: frontend_url,
  methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
  allowedHeaders: ["Origin", "X-Requested-With", "Content-Type", "Accept", "limit", "page"],
  credentials: true
};

// init express
const app = express();

// cors middleware
app.use(cors(corsConfig))

// init server
const server = useHttps ? https.createServer(app) : http.createServer(app);



// Build a connection to db and execute a query based on a callback
async function query(onConnection: Function, onError: Function) {
  try {

    // read db connection string
    const dbConfigJSONString = fs.readFileSync('database.config.json', 'utf-8');
    const dbConfig = JSON.parse(dbConfigJSONString);

    // connect to db
    const connection = await mysql.createConnection(dbConfig);
    await connection.connect();
    console.log('Database connection established :)');
    
    // execute callback after successful connection (should contain operations to execute)
    await onConnection(connection)

    // disconnect to db
    connection.end()

  } catch (e) {
    console.error(e)

    // execute callback for error handling
    onError()
  }
}


// get the amount of rows of a certain table
async function getCountOfRows(connection: mysql.Connection, table: string) {

  // read count of different ids
  const [totalRows] = await connection.execute(`SELECT COUNT(id) FROM ${table}`);

  // return count of ids
  return (totalRows as any)[0]['COUNT(id)'];
}

// get all cars
app.get('/cars', async (req, res) => {
  
  // define empty list for cars
  let carsList = [];

  // read limit and page values for paginiation from header
  const limit = req.headers['limit']
  const page = req.headers['page']

  // if undefined limit and/or page values, send an error message
  if (!limit || limit === undefined || !page || page === undefined) {
    res.status(500).send('No values for (either or both) limit and page specified.');
    return
  }

  // define query operations to execute and error handling
  const connection = await query(async (connection: mysql.Connection) => {
    try {

      // get number of cars
      const total = await getCountOfRows(connection, 'car')
      
      // execute query to get cars on defined page with defined limit
      const [rows] = await connection.query<RowDataPacket[]>(`SELECT * FROM car LIMIT ${limit} OFFSET ${page};`)
  
      // map the result to represent car objects
      carsList = rows.map(row => {
        return {
          id: row['id'],
          name: row['name'],
          brand: row['brand'],
          horsepower: row['horsepower'],
          isItalian: row['isItalian'],
          photo: row['photo'],
          price: row['price'],
          description: row['description']
        };
      });

      // add paginiation info as additional headers to the response
      res.appendHeader('limit', `${limit}`);
      res.appendHeader('page', `${page}`);
      res.appendHeader('total', `${total}`);
      
      // return the array of cars as in json format as the request result
      res.json(carsList);
  
      // handle errors
    } catch (e) {
      console.error(e);
      res.status(500).send('Error retrieving cars.');
      return
    }
  }, () => {
    // handle db connection errors
    res.status(500).send('No connection to database.');
    return
  });
  

});

// get 1 single car
app.get('/cars/:id', async (req, res) => {

  // read id from url
  const id = req.params.id;

  // define callbacks to execute when connecting to db
  const connection = await query(async (connection: mysql.Connection) => {
    try {

      // get the car (insert the id as a variable to ensure some safety for sql injections)
      const [rows] = await connection.query<RowDataPacket[]>(`SELECT * FROM car WHERE id = ? LIMIT 1;`, [id]);
      
      // map the result into a car object
      const carsList = rows.map(row => {
        return {
          id: row['id'],
          name: row['name'],
          brand: row['brand'],
          horsepower: row['horsepower'],
          isItalian: row['isItalian'],
          photo: row['photo'],
          price: row['price'],
          description: row['description']
        };
      });
      
      // return the car if one was found
      if (carsList.length > 0) {
        res.json(carsList[0]);

      // else send an error message 404
      } else {
        res.status(404).send('car not found.');
      }

      // handle other errors
    } catch (e) {
      console.error(e);
      res.status(500).send('Error retrieving the car.');
    }
  }, () => {
    //handle db oconnetion errors
    res.status(500).send('No connection to database.');
    return
  });

});

// Start the server
app.listen(backend_port, () => {
  console.log(`uwu: http://localhost:${backend_port}/`);
});
