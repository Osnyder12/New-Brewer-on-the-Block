import React from "react";

const ReviewTile = (props) => {
  let deleteButton = null;
  if (props.currentUser?.role === "admin") {
    deleteButton = (
      <button type="button" className="alert button" onClick={props.handleClick}>
        Delete
      </button>
    );
  }

  return (
    <li>
      <span>Rating:</span>
      <p>{props.review.rating}</p>
      <span>Difficulty:</span>
      <p>{props.review.difficulty}</p>
      <p>{props.review.comment}</p>
      {deleteButton}
    </li>
  );
};

export default ReviewTile;
