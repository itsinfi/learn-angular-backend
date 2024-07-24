import express from 'express';
import mysql, { RowDataPacket } from 'mysql2/promise';
import { query } from "../../../utils/db/query";

// init router
const carDetailsRouter = express.Router();
carDetailsRouter.use(express.json());

// get 1 single car
carDetailsRouter.get('/cars/:id', async (req, res) => {

    // read id from url
    const id = req.params.id;

    // define callbacks to execute when connecting to db
    await query(async (connection: mysql.Connection) => {
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

export {
    carDetailsRouter
}