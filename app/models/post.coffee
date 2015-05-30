mongoose = require "mongoose"
Schema = mongoose.Schema

postSchema = new Schema({
	author: String
	title: String
	description: String
	comments: Array
	tags: Array
	slug: String
}) 

module.exports = mongoose.model 'Post', postSchema