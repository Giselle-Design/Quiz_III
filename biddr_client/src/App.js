import React, { Component } from 'react';
import './App.css';
import AuctionShowPage from './AuctionShowPage';
import AuctionIndexPage from './AuctionIndexPage';


class App extends Component {
  render(){
    return(
      <div>
        <AuctionIndexPage />
        <AuctionShowPage />
      </div>

    );
  }
}

export default App;
