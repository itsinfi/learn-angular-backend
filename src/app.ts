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
  allowedHeaders: ["Origin", "X-Requested-With", "Content-Type", "Accept"],
  credentials: true
};

// init express
const app = express();

// cors middleware
app.use(cors(corsConfig))

// init server
const server = useHttps ? https.createServer(app) : http.createServer(app);



// Initialize database connection
async function connectToDB(): Promise<mysql.Connection | null> {
  try {
    const dbConfigJSONString = fs.readFileSync('database.config.json', 'utf-8');
    const dbConfig = JSON.parse(dbConfigJSONString);

    const connection = await mysql.createConnection(dbConfig);

    await connection.connect();

    console.log('Database connection established :)');
    return connection;
  } catch (e) {
    console.error(e);
    return null;
  }
}

// get aäll cars
app.get('/cars', async (req, res) => {
  let carsList = [];

  try {
    const connection = await connectToDB();

    if (connection === null) {
      return
    }

    const [rows] = await connection.query<RowDataPacket[]>('SELECT * FROM car;')

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

    connection.end()

    res.json(carsList);

  } catch (e) {
    console.error(e);
    res.status(500).send('Error retrieving cars.');
  }

});

// get 1 single car
app.get('/cars/:id', async (req, res) => {
  const id = req.params.id;

  try {
    const connection = await connectToDB();

    if (connection === null) {
      return
    }

    const [rows] = await connection.query<RowDataPacket[]>(`SELECT * FROM car WHERE id = ? LIMIT 1;`, [id]);

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

    connection.end()

    if (carsList.length > 0) {
      res.json(carsList[0]);
    } else {
      res.status(404).send('car not found.');
    }
  } catch (e) {
    console.error(e);
    res.status(500).send('Error retrieving the car.');
  }
});

// Start the server
app.listen(backend_port, () => {
  console.log(`uwu: http://localhost:${backend_port}/`);
});
