import React from 'react'

function BidDetails(props) {
  const createdAt = new Date(props.created_at)
  return (
    <div style={styles.container} className='ui segment'>
      <p>
        {props.price}<br/>
      </p>
    </div>
  )
}

const styles = {
  container: {
    color: 'red'
  },
  heading: {
    color: 'blue'
  }
}
export default BidDetails