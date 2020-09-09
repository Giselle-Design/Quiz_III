import React, { Component } from 'react';
import AuctionDetails from './AuctionDetails';
import oneAuctionData from './oneAuctionData';
import BidsList from './BidsList'


class AuctionShowPage extends Component{
    constructor(props){
        super(props);
        this.state = {
            auction: oneAuctionData
        }
    }
    render(){
        return(
           <div id='auctionShowPage' className='container_one'>
             <hr/>
             <h1>Auction Details</h1>
              <AuctionDetails 
              title={this.state.auction.title}
              description={this.state.auction.description}
              price={this.state.auction.price}
              created_at={this.state.auction.created_at}
              / >
                  <BidsList bids={this.state.auction.bids} />
           </div>
        );
    }
}

export default AuctionShowPage
