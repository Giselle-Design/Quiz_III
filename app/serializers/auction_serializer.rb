class AuctionSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :description,
    :price,
    :created_at,
    :updated_at
  )
# to include associated models, use the same method for
#creating associations also you can re-name the association with a key.
  belongs_to :user, key: :bidder
  has_many :bids

  class UserSerializer < ActiveModel::Serializer
    attributes(
    :id,
    :full_name,
    :created_at,
    :updated_at
  )
  end


  class BidSerializer < ActiveModel::Serializer
    attributes(
    :id,
    :price,
    :created_at,
    :updated_at
  )
  end


end
