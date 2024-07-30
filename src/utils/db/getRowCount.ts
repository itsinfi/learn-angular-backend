import mysql from 'mysql2/promise';

// get the amount of rows of a certain table
async function getCountOfRow(connection: mysql.Connection, table: string, row: string = 'id', search: string = '') {

    // read count of different ids
    const [totalRows] = await connection.execute(
        `
        SELECT COUNT(DISTINCT ${row}) AS 'count'
        FROM ${table};
        `
    );

    // return count of ids
    return (totalRows as any)[0][`count`];
}

export {
    getCountOfRow
}