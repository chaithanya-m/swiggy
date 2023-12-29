import React from "react";
import PropTypes from "prop-types";
import image from "../../../assets/images/paneer.avif";
import "../../../assets/stylesheets/restaurants/food_items.css";

const FoodItems = (props) => {
  const checkIfItemInCart = (itemId) => {
    if (!props.item_in_cart) {
      return {
        isInCart: false,
        quantity: 0,
      };
    }
    const matchingItem = props.item_in_cart.find(item => item.food_item_id == itemId);
    debugger
    if (matchingItem) {
      return {
        isInCart: true,
        quantity: matchingItem.quantity,
      };
    } else {
      return {
        isInCart: false,
        quantity: 0,
      };
    }
  };

  return (
    <React.Fragment>
      <div className="main_body">
        <div>
          <p className="RestaurantName">{props.restaurant.name}</p>
          <p className="RestaurantNameAddress">{props.restaurant.spaciality}</p>
          <p className="RestaurantNameAddress">{props.restaurant.area}</p>
          <hr/>
        </div>
        <div>
          {props.food_items.map((item, index) => (
            <div className="col-12" key={index}>
              <div>
                <div className="row">
                  <div key={index} className="col-md-10">
                    <h3 className="styles_itemNameText">{item.name}</h3>
                    <p className="styles_itemPrice">Rs. {item.price}</p>
                    <p className="description">{item.description}</p>
                  </div>
                  <div className="col-md-2 image-container">
                    <div className="">
                      <img className="food_item_image image " src={image} alt="food_item_image" height={96} width={118}/>
                      <div className="cart-container">
                        <div className="cart-container-items">
                          {checkIfItemInCart(item.id).isInCart ? (
                            <div>
                              <div className="row">
                                <div className="col-4">-</div>
                                <div className="col-4">{checkIfItemInCart(item.id).quantity}</div>
                                <div className="col-4">+</div>
                              </div>
                            </div> 
                          ) : (
                            <div className="cart-button"> ADD </div>
                          )}
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <hr/>
            </div>
          ))}
        </div>
      </div>
    </React.Fragment>
  );
};

FoodItems.propTypes = {
  restaurant: PropTypes.object.isRequired,
  food_items: PropTypes.array.isRequired,
  // item_in_cart: PropTypes.array.isRequired,
};

export default FoodItems;
