import React from "react";

const ReviewTile = (props) => {
  return (
    <li>
      <span>Rating:</span>
      <p>{props.review.rating}</p>
      <span>Difficulty:</span>
      <p>{props.review.difficulty}</p>
      <p>{props.review.comment}</p>
    </li>
  );
};

export default ReviewTile;
