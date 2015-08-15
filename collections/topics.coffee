#

@Topics = new Mongo.Collection 'topics'

#

Topics.helpers

	topics: ->
		Topics.find { _id: @parentId }

#

Topics.before.insert (userId, topic) ->
	_.extend topic,
		createdAt: new Date()

#

Meteor.methods

	newTopic: (opt) ->
		Topics.insert opt

	removeTopics: ->
		Topics.remove {}

#

if Meteor.isServer

	#

	Meteor.publish 'findTopics', (selector, options) ->
		Topics.find selector, options

	#

	Meteor.publish 'findTopic', (id) ->
		Topics.find { _id: id }
