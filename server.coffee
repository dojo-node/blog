express = require('express')
mongoose = require('mongoose')

app = express()

bodyParser = require('body-parser')
Post = require('./app/models/post' )

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

post = new Post
post.title = 'Test 1'
post.author = 'Test 2'
post.description = 'Test 3'
post.save (err) ->
	if err? then console.log err
	else
		console.log "new post created!!!"
#Cat = mongoose.model('Cat', name: String)
#kitty = new Cat(name: 'Zildjian')
#kitty.save (err) ->
#  if err
#    console.log 'meow'
#  return
