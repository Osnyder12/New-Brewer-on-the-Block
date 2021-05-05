import React, { useState } from "react";
import ReviewTile from "./ReviewTile";

const ReviewsContainer = (props) => {
  if (props.reviews.length > 0) {
    const reviewArray = props.reviews.map((review) => {
      return <ReviewTile key={review.id} review={review} />;
    });
    return <ul className="reviews">{reviewArray}</ul>;
  } else {
    return <p>No Reviews Yet!</p>;
  }
};

export default ReviewsContainer;
