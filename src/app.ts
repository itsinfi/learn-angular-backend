import express from 'express';
import fs from 'fs';
import cors from 'cors';
import http from 'http';
import https from 'https';


//Route imports
import { carsRouter } from './api/cars/cars';
import { carDetailsRouter } from './api/cars/details/car-details';
import { carBrandsRouter } from './api/cars/brands/car-brands';


// init express
const app = express();

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
    "Accept",
    "Authorization",
    "Content-Type",
    "Content-Length",
    "Origin",
    "X-Requested-With",
    "Limit",
    "Page",
    "Search",
    "Brand"
  ],
  credentials: true,
  optionsSuccessStatus: 204
};

// cors middleware
app.use(cors(corsConfig));
app.use(express.json());


//Route Definitions
app.get('/cars', carsRouter);
app.get('/cars/details/:id', carDetailsRouter);
app.get('/cars/brands', carBrandsRouter);


// init server
const server = useHttps ? https.createServer(app) : http.createServer(app);

// Start the server
server.listen(backend_port, () => {
  console.log(`uwu: http://localhost:${backend_port}/`);
});