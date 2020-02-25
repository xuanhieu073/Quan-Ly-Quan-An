const express = require('express');
const chinhanhModel = require('../models/chinhanh.model');

const router = express.Router();

router.get('/', async (req, res, next) => {
  const rows = await chinhanhModel.all();
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
    const rows = await chinhanhModel.loadById(id);
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
    const results = await chinhanhModel.add(req.body);
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