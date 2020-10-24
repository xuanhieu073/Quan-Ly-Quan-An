const express = require('express');
const categoryModel = require('../models/category.model');
const productModel = require('../models/product.model');
const menuchinhanhModel = require('../models/menuchinhanh.model')

const router = express.Router();

router.get('/', async (req, res, next) => {
  const rows = await categoryModel.loadAllWithDetails();
  res.json(rows);
})

router.get('/all', async (req, res, next) => {
  const rows = await categoryModel.all();
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

router.get('/:catid/chinhanh/:chinhanhid/products', async(req,res)=>{
  const catid = req.params.catid
  const chinhanhid = req.params.chinhanhid
  
  const rows = await menuchinhanhModel.loadbyCatId(chinhanhid,catid)
  return res.json(rows);
})

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

router.delete('/:id', async (req, res) => {
  const id = req.params.id;
  if (isNaN(id)) {
    return res.status(400).json({
      err: 'Invalid id.'
    });
  }
  const resutls = await categoryModel.del(id);
  res.json(resutls);
})

router.patch('/:id', async (req, res) => {
  const id = req.params.id;
  if(isNaN(id)){
    res.status(400).json('ivalid id');
  }
  try{
    const results = await categoryModel.patch(id, req.body)
    res.json({
      msg: 'patched'
    });
  }
  catch{err=>{
    throw new Error(err);
  }}
})

module.exports = router;