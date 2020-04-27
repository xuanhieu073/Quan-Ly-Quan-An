const express = require('express');
const menuchinhanhModel = require('./../models/menuchinhanh.model')
const categoryModel = require('./../models/category.model')

const router = express.Router();

function processArray(items, process) {
  var todo = items.concat();

  setTimeout(function() {
      process(todo.shift());
      if(todo.length > 0) {
          setTimeout(arguments.callee, 25);
      }
  }, 25);
}

router.get('/', async (req, res, next) => {
  const rows = await menuchinhanhModel.all();
  res.json(rows);
})

router.get('/chinhanh/:id', async (req,res)=>{
  const id = req.params.id;
  if(isNaN(id))
    res.status(400);
  const cats = await categoryModel.all();
  let i = 0;
  processArray(cats,item=>{
      let cat = item;
      menuchinhanhModel.loadbyCatId(id,cat.CatID)
      .then((items)=>{
        for(let j=0;j<items.length;j++){
          if(items[j].check == 1)
            items[j].check = true;
        }
        cat.items = items;
        if(i==cats.length-1){
          res.json(cats);
        }
        i++
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
    for(let i=0;i<req.body.length;i++){
      const check = await menuchinhanhModel.loadById(req.body[i].ChiNhanhId,req.body[i].FoodId)
      if(!check[0])
        await menuchinhanhModel.add(req.body[i]);
    }
    res.status(201).json(1);
  } catch (err) {

  }
})

router.delete('/', async (req, res) => {
  for(let i=0;i<req.body.length;i++){
    const check = await menuchinhanhModel.loadById(req.body[i].ChiNhanhId,req.body[i].FoodId)
    if(check[0]){
      await menuchinhanhModel.del(req.body[i].ChiNhanhId, req.body[i].FoodId)
    }
  }
  res.json(1);
})

router.patch('/patch', (req, res) => {
  res.json({
    msg: 'patched'
  });
})

module.exports = router;