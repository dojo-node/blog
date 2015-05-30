express = require('express')
mongoose = require('mongoose')

app = express()

bodyParser = require('body-parser')

app.use bodyParser.urlencoded(extended: true)
app.use bodyParser.json()
port = process.env.PORT or 8080

router = express.Router()

router.get '/', (req, res) ->
  res.json message: 'hooray! welcome to our api!'
  return

app.use '/api', router

app.listen port
console.log 'Magic happens on port ' + port

mongoose.connect 'mongodb://localhost/test'
Cat = mongoose.model('Cat', name: String)
kitty = new Cat(name: 'Zildjian')
kitty.save (err) ->
  if err
    console.log 'meow'
  return
