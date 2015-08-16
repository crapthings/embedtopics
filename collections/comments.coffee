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

Comments.after.insert (userId, comment) ->
	if comment.masterId
		Topics.update topic.masterId,
			$inc:
				'stats.comments': 1

#

Meteor.methods

	newComment: (opt) ->
		console.log opt
		Comments.insert opt

#

if Meteor.isServer

	#

	Meteor.publishTransformed 'findComments', (selector, options) ->
		Comments.find(selector, options).serverTransform
			user: (comment) -> Meteor.users.findOne comment.userId
