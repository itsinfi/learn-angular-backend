import express from 'express';
import mysql, { RowDataPacket } from 'mysql2/promise';
import { query } from "../../utils/db/query";

// init router
const flagRouter = express.Router();

// get 1 flag img file from specifying the origin (3 digits)

flagRouter.get('/flag/:origin', async (req, res) => {

    // read origin from url
    const origin = req.params.origin;

    // define callbacks to execute when connecting to db
    await query(async (connection: mysql.Connection) => {
        try {

            // get the flag of specified origin
            const [rows] = await connection.query<RowDataPacket[]>(
                `
                SELECT image
                FROM flag
                WHERE LOWER(origin) = LOWER(?)
                LIMIT 1
                ;
                `,
                [origin]
            );

            // map the result
            const flagList = rows.map(row => {
                return {
                    data: row['image']
                };
            });

            console.log(flagList)

            // return the flag if one was found
            if (flagList.length > 0) {
                res.json(flagList[0]);
            
            // else send a 404 message
            } else {
                res.status(404).send('flag not found.');
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
    flagRouter
};