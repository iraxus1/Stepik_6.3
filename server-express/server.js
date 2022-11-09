const express = require('express');
const app = express();

const port = process.env.DB_PORT || '5432';
const host = process.env.DB_HOST || 'localhost';

const { Pool } = require('pg');
const pool = new Pool({
    user: 'postgres',
    host: host,
    database: 'postgres',
    password: 'postgres',
    port: parseInt(port),
})

app.listen(3000, '0.0.0.0', () => {
    console.log('Application listening at 0.0.0.0:3000');
})

app.get('/cars', async(req, res) => {
    pool.query('SELECT * FROM cars', (err, result) => {
        if (err) {
            console.log(err);
        } else {
            res.json(result.rows);
        }
    })
});

app.post('/addCar/:model/:year/:details', async(req, res) => {
    pool.query('INSERT INTO cars (model, year, details) VALUES ($1, $2, $3)', [req.params.model, req.params.year, req.params.details], (err, result) => {
        if (err) {
            console.log(err);
        } else {
            res.json(result.rows);
        }
    })
});
