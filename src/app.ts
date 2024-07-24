import express from 'express';
import fs from 'fs';
import cors from 'cors';
import http from 'http';
import https from 'https';


//Route imports
import { carsRouter } from './api/cars/cars';
import { carDetailsRouter } from './api/cars/details/car-details';


// init express
const app = express();


//Route Definitions
app.get('/cars', carsRouter);
app.get('/cars/:id', carDetailsRouter);


// read config
const configJSONString = fs.readFileSync('config.json', 'utf-8');
const config = JSON.parse(configJSONString);

// read config values
const backend_port = config.backend_port;
const frontend_url = config.frontend_url;
const useHttps = config.useHttps;

// create cors config object
const corsConfig = {
  origin: frontend_url,
  methods: ["GET"],
  allowedHeaders: [
    "Origin",
    "X-Requested-With",
    "Authorization",
    "content-type",
    "content-length",
    "Accept",
    "limit",
    "page",
    "search"],
  credentials: true,
};

// cors middleware
app.use(cors(corsConfig))

// init server
const server = useHttps ? https.createServer(app) : http.createServer(app);

// Start the server
server.listen(backend_port, () => {
  console.log(`uwu: http://localhost:${backend_port}/`);
});

export {
  app
}