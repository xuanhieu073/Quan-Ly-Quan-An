var express = require('express'),
	bodyParser = require('body-parser'),
	morgan = require('morgan'),
	cors = require('cors'),
	path = require('path');

var categoryCtrl = require('./apiControllers/categoryController'),
	productCtrl = require('./apiControllers/productController'),
	userCtrl = require('./apiControllers/userController'),
	orderCtrl = require('./apiControllers/orderController');

var verifyAccessToken = require('./repos/authRepo').verifyAccessToken;

var app = express();

app.use(morgan('dev'));
app.use(cors());
app.use(bodyParser.json());

var staticDir = express.static(
    path.resolve(__dirname, 'public')
);
app.use(staticDir);

app.use('/categories', categoryCtrl);
app.use('/users', userCtrl);
app.use('/products', productCtrl);
app.use('/orders', verifyAccessToken, orderCtrl);

const port = process.env.PORT || 3000;
app.listen(port, () => {
	console.log(`API running on port ${port}`);
});