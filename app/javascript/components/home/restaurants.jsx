import React from "react"
import PropTypes from "prop-types"
import "../../../assets/stylesheets/home/restaurants.css"
// import '/home/chaithanya/chaithanya/swiggy/app/assets/stylesheets/header.css'

const Restaurants = (props) => {
  return (
      <div className="  body_center">
        <div className=" horizontal-scroll ">
          {props.categories.map((category, index) => (
    
         
          <div className="scroll-content" key={index}>
            <div>{category.name}</div>
          </div>
          ))}
        </div>        
      </div>
  )
}


export default Restaurants
