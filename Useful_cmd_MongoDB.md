
# MongoDB Query examples

### Find a field w/wo a specific tag

```JavaScript
// Find documents with a field (defect)
db.getCollection('sofc').find({"defect": {"$exists": true}})
// Find documents without a tag 
db.getCollection('organic_mol_pbe').find({"calculations.0.input.incar.METAGGA": {"$exists": true }})
```

### Find a field with a specific size

```JavaScript
// Find documents with a field (icsd_ids) of size 2
db.getCollection('sofc').find({"icsd_ids": { "$size": 2 }})
// Find documents with a field (icsd_ids), of which the size is greater than 1
db.getCollection('sofc').find({"icsd_ids": {"$exists":true, "$ne":[]}})
```

### Find a field containing one string using RE

```JavaScript
// Find result updated from comet
db.getCollection('organic_mol').find({"dir_name": {'$regex' : '.*' + 'comet' + '.*'}})
```

### Show interested information only

```JavaScript
db.getCollection('organic_mol_pbe').find(
  {"task_id": {"$in": [151029, 151030, 151032, 151708, 151709, 151715]}},
  {"dir_name": 1, "output.final_energy": 1, "task_id": 1})
```

# MongoDB Update examples

### Delete what you find, simply change `find` to `deleteMany`

```JavaScript
db.getCollection('organic_mol').deleteMany({"dir_name": {'$regex' : '.*' + 'comet' + '.*'}})
```

### Update field
```JavaScript
// Example 1
db.getCollection('fireworks').update(
    {"fw_id": 1050},
    {"$set": {"spec._tasks.0.user_incar_settings.EDIFF": 0.1}})
    
// Example 2, substitute with data type given
db.getCollection('fireworks').update(
    {"fw_id": 1}, 
    {"$set": {"spec.max_steps": NumberInt(25000)}})
```

### Update INCAR setting in MD config (update item in an array)

```JavaScript
db.getCollection('md').updateOne(
  {"md_id": 741, "configs.config_id": 3},
  {"$set": {"configs.$.user_incar_settings.POTIM": 0.5}})
```
### Update One documentation ($set and $unset)

```JavaScript
db.getCollection('md').updateOne(
    {"md_id": 1}, 
    {"$set": {"comment": "NpT for 868_1_300_0, killed due to the slow run"}})

// Update will update 1 existing record every time
// Remove symprec_source field if it exists
db.getCollection('sofc').update(
    {"material_id": 1146}, {"$unset": {"symprec_source": ""}})
```

### Update Many documentations

```JavaScript
db.getCollection('launches').updateMany(
  {"fworker.env.vasp_cmd.2": "8"},
  {"$set": {"fworker.env.vasp_cmd.2": "12"}})
```

### Update using function

```JavaScript
db.getCollection('md').find().forEach(function(item) {  // a function for variable item
    if (item.md_id == 1) {                              //change the criteria where necessary
        item.config_count = {"whatever": "val"};
        db.md.save(item)
        }
    })
```

### Copy a subset of a collection to another collection

```JavaScript
db.calculations.find({"dir_name": {'$regex' : '.*' + "Li3YCl6" + '.*'}}).forEach(
function(doc){
   db.halide_SEs.insert(doc);
});
```
