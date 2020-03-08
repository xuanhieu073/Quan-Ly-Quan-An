const express = require('express');
const menuchinhanhModel = require('./../models/menuchinhanh.model')
const categoryModel = require('./../models/category.model')

const router = express.Router();

router.get('/', async (req, res, next) => {
  const rows = await menuchinhanhModel.all();
  res.json(rows);
})

router.get('/chinhanh/:id', async (req,res)=>{
  const id = req.params.id;
  if(isNaN(id))
    res.status(400);
  const cats = await categoryModel.all();
  cats.forEach(function(cat,i){
    menuchinhanhModel.loadbyCatId(id,cat.CatID)
    .then((items)=>{
      cat.items = items;
      if(i==cats.length-1){
        res.json(cats);
      }
    })
    .catch((err)=>{
      console.log(err);
    })
  })
})

router.get('/:id', async (req, res) => {

  if (isNaN(req.params.id)) {
    return res.status(400).json({
      err: 'Invalid id.'
    });
  }

  const id = req.params.id || -1;
  const rows = await menuchinhanhModel.loadById(id);
  if (rows.length === 0) {
    res.status(204).end();
  } else {
    res.json(rows[0]);
  }
})

router.post('/', async (req, res) => {
  try {
    const results = await menuchinhanhModel.add(req.body);
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