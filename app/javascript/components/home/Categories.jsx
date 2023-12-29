// import React from "react"
import PropTypes from "prop-types"
import React, { useRef } from 'react';
import { BsArrowLeft, BsArrowRight } from 'react-icons/bs';
import image from "../../../assets/images/food.jpg"
import "../../../assets/stylesheets/home/categories.css"

const Categories = (props) => {

  const scrollContainerRef = useRef(null);

  const handleScroll = (direction) => {
    const scrollDistance = 500; // Adjust the scroll distance as needed
    const scrollContainer = scrollContainerRef.current;

    if (scrollContainer) {
      if (direction === 'left') {
        scrollContainer.scrollLeft -= scrollDistance;
      } else if (direction === 'right') {
        scrollContainer.scrollLeft += scrollDistance;
      }
    }};
 
  return (
    <div >
      <div className="row">
        <div className="col-10">
          <h4>What's on your mind?</h4>
          </div>
            <div className="col-2">
              <div className="arrows">
                <button className="scroll_arrows" onClick={() => handleScroll('left')} ><BsArrowLeft/></button>
                <button className="scroll_arrows" onClick={() => handleScroll('right')}> <BsArrowRight/></button>
              </div>
            </div>
          </div>
        <div className=" horizontal-scroll categorie" ref={scrollContainerRef} >
          {props.categories.map((category, index) => (
          <div className="scroll-content" key={index}>
            <div className="categorie_image">
              <a href="/">
                <img className="logo_image" src={image} alt=" logo" height={75} width={75}/>
              </a>
              <div>
                {category}
              </div>
            </div>
          </div>
          ))}
        </div>   
        <hr/>     
      </div>
  )
}


export default Categories
