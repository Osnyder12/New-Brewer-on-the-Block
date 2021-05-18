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
      <span>Rating (1-5): {props.review.rating}</span>
      <br />
      <span>Difficulty (1-10): {props.review.difficulty}</span>
      <p>{props.review.comment}</p>
      {deleteButton}
    </li>
  );
};

export default ReviewTile;
