const express = require('express');
const tinhthanhModel = require('./../models/tinhthanh.model')

const router = express.Router();

router.get('/', async (req, res, next) => {
  const rows = await tinhthanhModel.all();
  res.json(rows);
})

router.get('/:id', async (req, res) => {

  if (isNaN(req.params.id)) {
    return res.status(400).json({
      err: 'Invalid id.'
    });
  }

  const id = req.params.id || -1;
  const rows = await tinhthanhModel.loadById(id);
  if (rows.length === 0) {
    res.status(204).end();
  } else {
    res.json(rows[0]);
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
    const results = await tinhthanhModel.add(req.body);
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