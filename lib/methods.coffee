Meteor.methods

	reset: ->
		collections = Mongo.Collection.getAll()
		for collection in collections
			Mongo.Collection.get(collection.name).remove {}
