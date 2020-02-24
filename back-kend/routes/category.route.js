const express = require('express');
const categoryModel = require('../models/category.model');
const productModel = require('../models/product.model');

const router = express.Router();

router.get('/', async (req, res, next) => {
  const rows = await categoryModel.loadAllWithDetails();
  res.json(rows);
})

router.get('/:id', async (req, res) => {

  if (isNaN(req.params.id)) {
    return res.status(400).json({
      err: 'Invalid id.'
    });
  }

  const id = req.params.id || -1;
  try {
    const rows = await categoryModel.loadById(id);
    if (rows.length === 0) {
      res.status(204).end();
    } else {
      res.json(rows[0]);
    }
  } catch (err) {
    console.log(err);
    res.status(500);
    res.end('View error log on console.');
  }
})

router.get('/:id/products', async (req, res) => {
  var page = 1;
  if (req.query.page) {
      page = +req.query.page;
  }
  var id = req.params.id;
  const rows = await productModel.loadByCat(id);
  return res.json(rows);
});

router.post('/', async (req, res) => {
  try {
    const results = await categoryModel.add(req.body);
    const ret = {
      CatID: results.insertId,
      ...req.body
    }
    res.status(201).json(ret);
  } catch (err) {

  }
})

router.delete('/del', (req, res) => {
  res.json({
    msg: 'del'
  });
})

router.patch('/patch', (req, res) => {
  res.json({
    msg: 'patched'
  });
})

module.exports = router;