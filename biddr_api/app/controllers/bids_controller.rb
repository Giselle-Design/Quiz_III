class BidsController < ApplicationController

  def create
     @auction = Auction.find params[:auction_id]
     @bid = Bid.new bid_params
     @bid.auction = @auction
     @bid.user = current_user
   if @bid.save
     redirect_to auction_path(@auction)
   else
     @bids = @auction.bids.order(created_at: :desc)
     render "auctions/show"
   end
  end

  def destroy
    @bid = Bid.find params[:id]
    if can?(:crud, @bid)
    @bid.destroy
    redirect_to auction_path(@bid.auction)
  else
    head :unauthorized
    end
  end


  private

  def bid_params
    params.require(:bid).permit(:price)
  end


end
