express = require('express')
mongoose = require('mongoose')
bodyParser = require('body-parser')
Post = require('./app/models/post' )
Route = require('./app/route') 

app = express()

app.use bodyParser.urlencoded(extended: true)
app.use bodyParser.json()
routeConfig = new Route express, app

port = process.env.PORT or 8080

app.listen port
console.log 'server listening on port ' + port

mongoose.connect 'mongodb://localhost/test'

#post = new Post
#post.title = 'Test 1'
#post.author = 'Test 2'
#post.description = 'Test 3'
#post.save (err) ->
#	if err? then console.log err
#	else
#		console.log "new post created!!!"
#Cat = mongoose.model('Cat', name: String)
#kitty = new Cat(name: 'Zildjian')
#kitty.save (err) ->
#  if err
#    console.log 'meow'
#  return
