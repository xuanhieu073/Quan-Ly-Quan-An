const express = require('express');
var cors = require('cors')
const morgan = require('morgan');
const createError = require('http-errors');
require('express-async-errors');

const app = express();

app.use(cors());
app.use(morgan('dev'));
app.use(express.json());

app.get('/', (req, res) => {
  res.json({
    msg: 'hello from nodejs express api'
  });
})

app.use('/categories', require('./routes/category.route'));
app.use('/products', require('./routes/product.route'));
app.use('/chinhanh', require('./routes/chinhanh.route'));
app.use('/tinhthanh', require('./routes/tinhthanh.route'));

app.use((req, res, next) => {
  const err404 = createError(404, 'NOT FOUND');
  next(err404);
})

app.use(function (err, req, res, next) {
  console.error(err.stack);
  res.status(500).send('View error log on console.');
})

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`API is running at http://localhost:${PORT}`);
})