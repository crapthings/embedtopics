Router.route '/t/v/:_id', ->
	@render 'viewTopic',
		data: ->
			topic: Topics.findOne @params._id
			comments: Comments.find { topicId: @params._id }

,
	name: 'viewTopic'
	waitOn: ->
		subs.subscribe 'findTopic', @params._id
		subs.subscribe 'findTopics', { parentId: @params._id }
		subs.subscribe 'findComments', { topicId: @params._id }
