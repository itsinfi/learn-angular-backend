import mysql from 'mysql2/promise';

// get the amount of rows of a certain table
async function getCountOfRows(connection: mysql.Connection, table: string, search: string) {

    // read count of different ids
    const [totalRows] = await connection.execute(
        `SELECT COUNT(id)
        FROM ${table}
        WHERE LOWER(CONCAT(brand, ' ', name))
        LIKE LOWER(CONCAT('%', ?, '%'))`, [search]);

    // return count of ids
    return (totalRows as any)[0]['COUNT(id)'];
}

export {
    getCountOfRows
}