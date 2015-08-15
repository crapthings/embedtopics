helper = Template.registerHelper

helper 'fromNow', (date) ->
	return moment(date).fromNow()
