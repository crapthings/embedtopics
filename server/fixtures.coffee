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

	#

	demouser = Meteor.users.findOne()

	#

	_(50).times ->

		Topics.direct.insert
			userId: demouser._id
			title: faker.lorem.sentence()
			createdAt: _.sample [faker.date.past(), faker.date.recent(), new Date()]
			stats:
				topics: 0
				comments: 0
				views: 0
