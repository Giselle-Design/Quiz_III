import React, { Component } from 'react';
import auctionData from './auctionData';
import AuctionDetails from './AuctionDetails';

 

class AuctionIndexPage extends Component {
    constructor(props){
        super(props);
        this.state ={
            auction: auctionData
        }

    }
    render(){
        const auctions = this.state.auction.map( auction => {
            return(
                <AuctionDetails
                key={auction.id}
                title={auction.title}
                description={auction.description}
                price={auction.price}
                created_at={auction.created_at}
                />
            )
         })
        return(
            <div className='container_one'>
                <h1>Auction Index Page</h1>
                <hr/>
                <ul>
                    {auctions}
                </ul>
            </div>
      )
    }
  
}

export default AuctionIndexPage 