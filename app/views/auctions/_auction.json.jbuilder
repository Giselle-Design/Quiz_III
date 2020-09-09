json.extract! auction, :id, :title, :description, :price, :created_at, :updated_at
json.url auction_url(auction, format: :json)
