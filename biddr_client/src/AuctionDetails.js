import React from 'react';

import './AuctionDetails.css';

export default function AuctionDetails(props) {
  const createdAt = new Date(props.created_at);
  return (
    <div className='container'>
      <h2>{props.title}</h2>
      <p>
        {props.description}<br />
        {props.price}<br />   
      </p>
      <p>
      <small>{ props.id ? props.bidder.full_name : ''}</small>
      <small>Created at {createdAt.toString()}</small>
      </p>
    </div>
  )
}