#

Router.route '/', ->

	#

	@render 'home',
		data: ->
			topics: Topics.find { masterId: $exists: false },
				sort:
					createdAt: -1
				limit: 50

,

	#

	name: 'home'

	#

	waitOn: ->
		subs.subscribe 'findTopics', { masterId: $exists: false },
			sort:
				createdAt: -1
			limit: 50
