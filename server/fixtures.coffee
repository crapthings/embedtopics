#

faker = Meteor.npmRequire 'faker'

#

collections = Mongo.Collection.getAll()
for collection in collections
	Mongo.Collection.get(collection.name).remove {}

#

# Meteor.startup ->

# 	_(1).times ->

# 		topicId = Topics.insert
# 			title: faker.lorem.sentence()

# 		_(10).times ->
# 			Topics.insert
# 				topicId: topicId
# 				title: faker.lorem.sentence()
