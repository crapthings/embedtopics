Router.route '/', ->
	@render 'home',
		data: ->
			topics: Topics.find { parentId: $exists: false },
				sort:
					createdAt: -1
				limit: 50
,
	name: 'home'
	waitOn: ->
		subs.subscribe 'findTopics', { parentId: $exists: false },
			sort:
				createdAt: -1
			limit: 50
