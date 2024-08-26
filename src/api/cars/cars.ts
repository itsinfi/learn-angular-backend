import express from 'express';
import mysql, { RowDataPacket } from 'mysql2/promise';
import { query } from "../../utils/db/query";
import { readHeaderNumber } from "../../utils/http/readHeaderNumber";
import { readHeaderString } from "../../utils/http/readHeaderString";
import { getRowCount } from "../../utils/db/getRowCount";
import { readHeaderStringArray } from '../../utils/http/readHeaderStringArray';

// init router
const carsRouter = express.Router();

// get all cars
carsRouter.get('/cars', async (req, res) => {


  // define query operations to execute and error handling
  const connection = await query(async (connection: mysql.Connection) => {
    try {

      // define empty list for cars
      let carsList = [];
      
      // read limit and page values for paginiation from header
      const limit = readHeaderNumber(req.headers['limit']);
      const page = readHeaderNumber(req.headers['page']);
      
      // read search value from header
      const search = readHeaderString(req.headers['search']);
      
      // read filter related values from header
      const brand = readHeaderString(req.headers['brand']);

      // if undefined limit and/or page values, send an error message
      if (limit === null || limit === undefined || page === null || page === undefined) {
        res.status(500).send('No values for (either or both) limit and page specified.');
        return
      }

      // get number of cars
      const total = await getRowCount(connection, 'car', undefined, search);

      // calculate offset
      const offset = (page - 1) * limit;

      // define query (change query based on whether filter is specified or not)
      const query = (brand === '')
        ?
          `
          SELECT *
          FROM car
          WHERE LOWER(CONCAT(brand, ' ', name)) LIKE LOWER(CONCAT('%', ?, '%'))
          LIMIT ?
          OFFSET ?;
          `
        :
          `
          SELECT *
          FROM car
          WHERE
            LOWER(CONCAT(brand, ' ', name)) LIKE LOWER(CONCAT('%', ?, '%'))
            AND
            LOWER(brand) = LOWER(?)
          LIMIT ?
          OFFSET ?;
          `
      ;
      
      const params = (brand === '')
        ?
          [search, limit, offset]
        :
          [search, brand, limit, offset]
      ;
      
      // execute query to get cars on defined page with defined limit
      const [rows] = await connection.query<RowDataPacket[]>(query, params);
  
      // map the result to represent car objects
      carsList = rows.map(row => {
        return {
          id: row['id'],
          name: row['name'],
          brand: row['brand'],
          horsepower: row['horsepower'],
          origin: row['origin'],
          photo: row['photo'],
          price: row['price'],
          description: row['description']
        };
      });
      
      // return the array of cars as in json format as the request result
      res.json({ limit, page, total, data: carsList });
  
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

export {
  carsRouter
}