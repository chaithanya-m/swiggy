import React from "react"
import PropTypes from "prop-types"
import Restaurants from "./Restaurants"
import HederMenu from "../HederMenu"

const Index = (props) => {
  // debugger
  return (
    
    <React.Fragment>
      <div>
        {/* <HederMenu user={props.user} locations= {props.locations} select_location={props.select_location}></HederMenu> */}
      </div>
      <div >
        <Restaurants categories={props.categories } restaurants= {props.restaurants}></Restaurants>
      </div>
    </React.Fragment>
  )
}


export default Index
