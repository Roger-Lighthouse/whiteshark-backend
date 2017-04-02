json.client_list @clients do |client|
  json.id client.id
  json.name client.name
  json.address  client.address
  json.w1 client.prices.w1
  json.eh client.prices.eh

end