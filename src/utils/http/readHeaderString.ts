// just a small util to make sure the header is read properly and returned as a number value
function readHeaderString(header: string | string[] | undefined) {
    if (typeof(header) === 'string') {
        return header;
    } else if (Array.isArray(header) && header.length > 0) {
        return header[0]
    } else {
        throw 'Error reading header';
    }
}

export {
    readHeaderString
}