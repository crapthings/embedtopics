Template.newComment.events

	'submit form': (e, t) ->
		e.preventDefault()
		opt =
			topicId: @_id
			content: ($ t.find '.content').val()

		unless opt.content
			return

		Meteor.call 'newComment', opt, (err) ->
			unless err
				($ t.find '.content').val ''
