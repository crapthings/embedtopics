Router.route '/', ->
	@render 'home',
		data: ->
			topics: Topics.find { topicId: $exists: false },
				sort:
					createdAt: -1
				limit: 50
,
	name: 'home'
	waitOn: ->
		Meteor.subscribe 'findTopics', { topicId: $exists: false },
			sort:
				createdAt: -1
			limit: 50
