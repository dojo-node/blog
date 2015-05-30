express = require('express')
Post = require('../../app/models/post')

class PostController
	constructor: (@router) ->
		@router.route('/post')
			.get(@get)
			.post(@post)

		@router.route('/post/:id')
			.get(@get)
			.put(@put)
			.delete(@delete)

	get: (req, res) ->
		id = if req.params?.id? then req.params.id else null
		
		if id?
			Post.findOne { 
				_id: req.params.id 
			}, (err, post) ->
				res.json(err or post);	
		else	
			Post.find (err, posts) ->
				res.json(err or posts);

	post: (req, res) ->
		post = new Post(req.body)
		post.save (err) ->
			if err
				return res.send(err)
			res.send message: 'Post Added'

	put: (req, res) ->
		Post.findOne { 
			_id: req.params.id 
		}, (err, post) ->
			if err
				return res.send(err)

			for prop of req.body
				post[prop] = req.body[prop]

			post.save (err) ->
				if err
					return res.send(err)
				
				res.json message: 'Post updated!'

	delete: (req, res) ->
		Post.remove { _id: req.params.id }, (err, post) ->
			if err
				return res.send(err)

			res.json message: 'Successfully deleted'

module.exports = PostController