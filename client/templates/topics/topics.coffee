@toggleForm = (id) ->
	Session.set 'toggleForm', id

Template.topicItem.events

	'click .method-new-topic': (e, t) ->
		e.stopImmediatePropagation()
		Session.set 'toggleForm', @_id

	'click .method-close-form': (e, t) ->
		Session.set 'toggleForm', null

	'submit form': (e, t) ->
		e.preventDefault()
		e.stopImmediatePropagation()
		opt =
			topicId: @_id
			title: ($ t.find '.title').val()
		Meteor.call 'newTopic', opt, (err) ->
			unless err
				Session.set 'toggleForm', null

Template.topicItem.created = ->
	@subscribe 'findTopics', { _id: @data.topicId }

Template.topicItem.helpers

	topics: ->
		Topics.find { topicId: @_id },
			sort:
				createdAt: -1
			limit: 50
