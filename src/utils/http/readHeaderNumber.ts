// just a small util to make sure the header is read properly and returned as a number value
function readHeaderNumber(header: string | string[] | undefined) {
    if (typeof(header) === 'string') {
        return parseInt(header);
    } else if (Array.isArray(header) && header.length > 0) {
        return parseInt(header[0])
    } else {
        throw 'Error reading header';
    }
}

export {
    readHeaderNumber
}