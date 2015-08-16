#

@Topics = new Mongo.Collection 'topics'

#

Topics.before.insert (userId, topic) ->
	unless userId
		return

	_.extend topic,
		createdAt: new Date()
		userId: userId
		stats:
			topics: 0
			comments: 0
			views: 0

#

Topics.after.insert (userId, topic) ->
	if topic.masterId
		Topics.update topic.masterId,
			$inc:
				'stats.topics': 1

#

Meteor.methods

	newTopic: (opt) ->
		Topics.insert opt

	removeTopics: ->
		Topics.remove {}

#

if Meteor.isServer

	#

	Meteor.publishTransformed 'findTopics', (selector, options) ->
		Topics.find(selector, options).serverTransform
			user: (topic) -> Meteor.users.findOne topic.userId

	#

	Meteor.publish 'findTopic', (id) ->
		Topics.find({ _id: id }).serverTransform
			user: (topic) -> Meteor.users.findOne topic.userId
