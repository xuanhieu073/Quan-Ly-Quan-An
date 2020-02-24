const express = require('express');
const productModel = require('../models/product.model');

const router = express.Router();

router.get('/', async (req, res, next) => {
  const rows = await productModel.all();
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
    const rows = await productModel.loadById(id);
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

router.post('/', async (req, res) => {
  try {
    const results = await productModel.add(req.body);
    const ret = {
      ...req.body,
      ProID: results.insertId
    }
    res.status(201).json(ret);
  } catch (err) {
    res.status(500)
  }
})

router.delete('/:id', async (req, res) => {
  const id = req.params.id;
  if (isNaN(id)) {
    return res.status(400).json({
      err: 'Invalid id.'
    });
  }
  const resutls = await productModel.del(id);
  res.json(resutls);
})

router.patch('/:id', async (req, res) => {
  const id = req.params.id;
  if (isNaN(id)) {
    return res.status(400).json({
      err: 'Invalid id.'
    });
  }

  const results = await productModel.patch(id,req.body);
  res.json(results);
})

module.exports = router;