glob = require('glob')
path = require('path')

class Route
	constructor: (@express, @app) ->
		router = @express.Router()

		glob.sync('./app/controllers/**/*.js').forEach (file) ->
			Controller = require path.resolve(file)
			(new Controller router)

		@app.use '/api', router

module.exports = Route