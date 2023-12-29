import React from "react"
import PropTypes from "prop-types"
import Categories from "./Categories"
import HederMenu from "../HederMenu"
import Restaurants from "./Restaurants"

const Index = (props) => {
  return (
    
    <React.Fragment>
      <div>
        {/* <HederMenu user={props.user} locations= {props.locations} select_location={props.select_location}></HederMenu> */}
      </div>
      <div className="body_center">
        <div >
              <Categories categories={props.categories } restaurants= {props.restaurants}></Categories>
        </div>
        <div>
          <Restaurants restaurants= {props.restaurants}></Restaurants>
        </div>

      </div>
      
    </React.Fragment>
  )
}


export default Index
