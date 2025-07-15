const path = require('path');
const express = require('express');
const dotenv = require('dotenv');
const colors = require('colors');
const morgan = require('morgan');
const connectDB = require('./config/db');

dotenv.config({ path: './config/config.env' });

connectDB();

const transactions = require('./routes/transactions');

const app = express();

app.use(express.json());

if(process.env.NODE_ENV === 'development') {
  app.use(morgan('dev'));
}

app.use('/api/v1/transactions', transactions);

// Health check endpoint
app.get('/api/health', (req, res) => {
  res.status(200).json({ status: 'ok', message: 'API is healthy' });
});

if(process.env.NODE_ENV === 'production') {
  // In production, we're using a separate frontend service
  // So we don't need to serve static files here
  app.get('/', (req, res) => {
    res.send('API is running in production mode');
  });
} else {
  // In development, we might want to serve the frontend from the backend
  // But in our case, we're using a separate frontend service in development as well
  app.get('/', (req, res) => {
    res.send('API is running in development mode');
  });
}

const PORT = process.env.PORT || 9000;

app.listen(PORT, console.log(`Server running in ${process.env.NODE_ENV} mode on port ${PORT}`.yellow.bold));

