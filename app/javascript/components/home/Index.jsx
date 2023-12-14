import React from "react"
import PropTypes from "prop-types"
import Restaurants from "./restaurants"

const Index = (props) => {
  return (
    <React.Fragment>
      <div >
        <Restaurants categories={props.categories } restaurants= {props.restaurants}></Restaurants>
      </div>
    </React.Fragment>
  )
}


export default Index
