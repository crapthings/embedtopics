Template.newTopic.events

	'submit form': (e, t) ->
		e.preventDefault()
		opt =
			title: ($ t.find '.title').val()

		Meteor.call 'newTopic', opt, (err) ->
			unless err
				($ t.find '.title').val ''