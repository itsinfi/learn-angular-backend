// just a small util to make sure the header is read properly and returned as a number value
function readHeaderStringArray(header: string | string[] | undefined) {
    if (typeof(header) === 'string') {
        return [header];
    } else if (Array.isArray(header) && header.length > 0) {
        return header;
    } else {
        return [];
    }
}

export {
    readHeaderStringArray
}