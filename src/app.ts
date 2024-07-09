import express from 'express';
import mysql, { RowDataPacket } from 'mysql2/promise';
import fs from 'fs';

const app = express();
const port = 3000;

let connection: mysql.Connection;

// Initialize database connection
async function init(): Promise<boolean> {
  try {
    const dbConfigJSONString = fs.readFileSync('database.config.json', 'utf-8');
    const dbConfig = JSON.parse(dbConfigJSONString);

    connection = await mysql.createConnection(dbConfig);

    await connection.connect();

    console.log('Database connection established :)');
    return true;
  } catch (e) {
    console.error(e);
    return false;
  }
}

// get aäll cars
app.get('/cars', async (req, res) => {
  let carsList = [];

  try {
    if (!connection) {
      await init();
    }

    const [rows] = await connection.query<RowDataPacket[]>('SELECT * FROM car;');

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
    if (!connection) {
      await init();
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
app.listen(port, () => {
  console.log(`uwu: http://localhost:${port}/`);
});
