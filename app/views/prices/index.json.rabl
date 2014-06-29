collection @prices, :object_root=>false
attributes :price, :id
node :uri do |price|
    product_price_url :id => price.id
end