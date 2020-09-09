class AuctionCollectionSerializer < ActiveModel::Serializer
  attributes(
   :id,
   :title,
   :description,
   :price,
   :created_at,
   :updated_at
 )

 belongs_to :user, key: :bidder

 class UserSerializer < ActiveModel::Serializer
   attributes(
   :id,
   :full_name,
   :created_at,
   :updated_at
 )
 end
end
