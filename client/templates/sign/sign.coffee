Template.sign.events

	'submit form': (e, t) ->
		e.preventDefault()
		username = ($ t.find '.username').val()
		password = ($ t.find '.password').val()
		Meteor.loginWithPassword username, password, (err) ->
			unless err
				Router.go 'home'

	'click .signin': (e, t) ->
		($ 'form').trigger 'submit'

	'click .signup': (e, t) ->
		e.preventDefault()
		opt =
			username: ($ t.find '.username').val()
			password: ($ t.find '.password').val()
		Accounts.createUser opt, (err) ->
			unless err
				Router.go 'home'
