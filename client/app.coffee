Session.setDefault 'toggleForm', null

Router.configure
	layoutTemplate: 'layout'

Router.onAfterAction ->
	Session.set 'toggleForm', null
