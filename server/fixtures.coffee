#

faker = Meteor.npmRequire 'faker'

#

collections = Mongo.Collection.getAll()
for collection in collections
	Mongo.Collection.get(collection.name).remove {}

#

Meteor.startup ->

	#

	Accounts.createUser
		username: 'demo'
		password: 'demo'
