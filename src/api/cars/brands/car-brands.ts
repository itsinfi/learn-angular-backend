import express from 'express';
import mysql, { RowDataPacket } from 'mysql2/promise';
import { query } from "../../../utils/db/query";
import { getCountOfRow } from "../../../utils/db/getRowCount";

// init router
const carBrandsRouter = express.Router();

// get all cars
carBrandsRouter.get('/cars/brands', async (req, res) => {


    // define query operations to execute and error handling
    await query(async (connection: mysql.Connection) => {
    try {

        // define empty list for car brands
        let carBrands = [];

        // get number of car brands //TODO: total value
        const total = await getCountOfRow(connection, 'car', 'brand', '');
        
        // execute query to get car brands
        const [rows] = await connection.query<RowDataPacket[]>(
            `SELECT DISTINCT brand
            FROM car;`
        );

        // map the result to represent car objects
        carBrands = rows.map(row => {
            return row['brand'];
        });
        
        // return the array of cars as in json format as the request result
        res.json({ total, data: carBrands });

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
carBrandsRouter
}