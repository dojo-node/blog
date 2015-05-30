express = require 'express'

app = new express
port = process.env.PORT or 4000

app.use express.static __dirname + '/public'
app.listen port 
console.log "server running on port #{port}"