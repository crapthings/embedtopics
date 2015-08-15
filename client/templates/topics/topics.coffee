@toggleForm = (id) ->
	Session.set 'toggleForm', id

Template.topicItem.events

	'mouseover .ui-topic-item': (e, t) ->
		e.stopImmediatePropagation()
		($ t.find '.ui-topic-item .hide').show()

	'mouseout .ui-topic-item': (e, t) ->
		e.stopImmediatePropagation()
		($ t.find '.ui-topic-item .hide').hide()

	'click .method-new-topic': (e, t) ->
		e.stopImmediatePropagation()
		e.preventDefault()
		Session.set 'toggleForm', @_id
		Meteor.defer ->
			($ t.find '.title').focus()

	'click .method-close-form': (e, t) ->
		Session.set 'toggleForm', null

	'submit form': (e, t) ->
		e.preventDefault()
		e.stopImmediatePropagation()
		opt =
			masterId: @masterId or @_id
			parentId: @_id
			title: ($ t.find '.title').val()
		Meteor.call 'newTopic', opt, (err) ->
			unless err
				Session.set 'toggleForm', null

Template.topicItem.created = ->
	@subscribe 'findTopics', { $or: [{_id: @data.parentId}, {parentId: @data._id}] }

Template.topicItem.helpers

	topics: ->
		Topics.find { parentId: @_id },
			sort:
				createdAt: -1
			limit: 50
