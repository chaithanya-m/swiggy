import React from "react"
import PropTypes from "prop-types"
import image from "../../../assets/images/food.jpg"
import "../../../assets/stylesheets/home/restaurants.css"
  

const Restaurants = (props) => {

  const handleRestaurantClick = async (id) => {
    // console.log(`Clicked on restaurant with ID: ${id}`);
    try {
      const response = await fetch(`/restaurants/${id}`, {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
        },
      });
  
      if (response.ok) {
        // Handle success, if needed
        console.log('Location selected:', newLocation);
      } else {
        // Handle errors, if needed
        console.error('Error selecting location:', response.statusText);
      }
    } catch (error) {
      console.error('Error selecting location:', error.message);
    }
  };
  return (
    <React.Fragment>

      <div> 
        <div className="row">
          <div className="col-4">
          <div>
        {props.restaurants.map((restaurant, index)=>(
          <div  key={index} onClick={() => handleRestaurantClick(restaurant.id)}>
          <div className="categorie_image" >
              <img className="restaurant_image  " src={image} alt=" restaurant"/>
            <div className="restaurant_details">
              <b> {restaurant.name}</b>
              <br/>
              {restaurant.spaciality}
              <br/>
              {restaurant.area}

            </div>
          </div>
        </div>
        ))}
      </div> 
          </div>
        </div>

      </div>

      {/* */}
    </React.Fragment>
  )
}


export default Restaurants
