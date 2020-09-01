require 'json'

file = File.read('./products.json')

data_hash = JSON.parse(file)

pp data_hash