import mysql from 'mysql2/promise';
import fs from 'fs';

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

export {
    query
}