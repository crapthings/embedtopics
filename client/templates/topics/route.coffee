Router.route '/t/v/:_id', ->
	@render 'viewTopic',
		data: ->
			topic: Topics.findOne @params._id
			# topics: Topics.find { topicId: @params._id }

,
	name: 'viewTopic'
	waitOn: ->
		Meteor.subscribe 'findTopic', @params._id
		Meteor.subscribe 'findTopics', { topicId: @params._id }
