require 'mongo'
require 'redis'

# Connect to MongoDB using the environment variable
mongo_client = Mongo::Client.new(ENV['MONGO_URL'])

# Connect to Redis using the environment variable
redis_client = Redis.new(url: ENV['REDIS_URL'])

# Perform MongoDB operations
collection = mongo_client[:your_collection_name]

# Insert a document into MongoDB
doc = { name: 'John Doe', age: 30 }
result = collection.insert_one(doc)

# Find documents in MongoDB
# collection.find(name: 'John Doe').each do |document|
#   puts document
# end

# Find all documents in MongoDB
collection.find.each do |document|
  puts document
end

# Perform Redis operations
redis_client.set('mykey', 'Hello, Redis!')
puts redis_client.get('mykey')

# Close the connections
mongo_client.close
redis_client.close
