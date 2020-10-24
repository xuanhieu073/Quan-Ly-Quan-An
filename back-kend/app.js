const express = require('express');
var cors = require('cors')
const morgan = require('morgan');
const createError = require('http-errors');
const jwt = require('jsonwebtoken');
require('express-async-errors');
const path = require('path');

const app = express();

app.use(cors());
app.use(morgan('dev'));
app.use(express.json());

app.get('/', (req, res) => {
  res.json({
    msg: 'hello from nodejs express api'
  });
})



app.use('/api/auth', require('./routes/auth.route'));
app.use('/api/users', require('./routes/user.route'));

function verifyAccessToken(req, res, next) {
  const token = req.headers['x-access-token'];
  if (token) {
    jwt.verify(token, 'shhhhh', function (err, payload) {
      if (err) throw createError(403, err);
      
      next();
    });
  } else {
    throw createError(401, 'NO_TOKEN');
  }
}

var staticDir = express.static(
  path.resolve(__dirname, 'public')
);
app.use(staticDir);

app.use('/categories',verifyAccessToken, require('./routes/category.route'));
app.use('/products',verifyAccessToken, require('./routes/product.route'));
app.use('/chinhanh',verifyAccessToken, require('./routes/chinhanh.route'));
app.use('/tinhthanh',verifyAccessToken, require('./routes/tinhthanh.route'));
app.use('/menuchinhanh',verifyAccessToken, require('./routes/menuchinhanh.route'));
app.use('/donhang',verifyAccessToken, require('./routes/donhang.route'));

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