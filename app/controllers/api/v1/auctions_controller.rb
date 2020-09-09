class Api::V1::AuctionsController < Api::ApplicationController
  before_action :authenticate_user!, only: [:create,  :destroy]
  before_action :find_auction, only: [:show,  :destroy]
  before_action :authorize!, only: [:update, :destroy]

  def index
    auctions = Auction.order(created_at: :desc)
    render(json: auctions, each_serializer: AuctionCollectionSerializer)
  end

  def show
    auction = Auction.find(params[:id])
    render(json: auction)
  end


  def create
    auction = Auction.new auction_params
    auction.user = current_user
    if auction.save
      render json: {id: auction.id}
    else
      render(
        json: {errors: auction.errors},
        status: 422
      )
    end
  end

  def destroy
    if @auction.destroy
      render(json: { status: 200 }, status: 200 )
    end
  end

   private

   def find_auction
    @auction = Auction.find params[:id]
  end

   def auction_params
     params.permit(:title, :description, :price)
   end

   def authorize!
   if !can? :crud, @auction
     render(
       json: { error: "Unauthorized" },
       status: 401
     )
   end
 end


end
