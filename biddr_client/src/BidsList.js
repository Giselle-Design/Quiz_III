import React from 'react'
import BidDetails from './BidDetails';

function BidsList(props) {
  return(
    <div>
      { props.bids ? props.bids.map( (bid, i) => {
        return <BidDetails id={bid.id} 
        key={i} 
        price={bid.price} 
        bidder={bid.bidder} 
        createdAt={bid.createdAt} 
        handleDeleteBid={props.handleDeleteBid}/>
      }) : null }
    </div>
  )
}

export default BidsList;