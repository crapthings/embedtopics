#

@Comments = new Mongo.Collection 'comments'

#

Comments.before.insert (userId, comment) ->
	unless userId
		return

	_.extend comment,
		createdAt: new Date()
		userId: userId

#

Meteor.methods

	newComment: (opt) ->
		console.log opt
		Comments.insert opt

#

if Meteor.isServer

	Meteor.publish 'findComments', ->
		Comments.find {}

	#

	# Meteor.publishTransformed 'findComments', (selector, options) ->
	# 	console.log selector, options
	# 	Topics.find(selector, options).serverTransform
	# 		user: (comment) -> Meteor.users.findOne comment.userId
