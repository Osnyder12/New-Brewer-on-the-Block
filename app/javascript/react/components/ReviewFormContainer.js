import React, { useState } from "react";
import _ from "lodash";
import ErrorList from "./ErrorList";

const ReviewFormContainer = (props) => {
  const [formFields, setFormFields] = useState({
    rating: "",
    difficulty: "",
    comment: "",
  });

  const validForSubmission = () => {
    let submitErrors = {};
    const requiredFields = ["rating", "difficulty", "comment"];
    requiredFields.forEach((field) => {
      if (formFields[field].trim() === "") {
        submitErrors = {
          ...submitErrors,
          [field]: "is blank",
        };
      }
    });
    props.setErrors(submitErrors);
    return _.isEmpty(submitErrors);
  };

  const handleFieldChange = (event) => {
    setFormFields({
      ...formFields,
      [event.currentTarget.name]: event.currentTarget.value,
    });
  };

  const handleFormSubmit = (event) => {
    event.preventDefault();
    if (validForSubmission()) {
      props.addNewReview(formFields);
      setFormFields({
        rating: "",
        difficulty: "",
        comment: "",
      });
    }
  };

  const clearForm = (event) => {
    event.preventDefault();
    setFormFields({
      rating: "",
      difficulty: "",
      comment: "",
    });
  };

  let reviewForm = null;
  if (props.currentUser) {
    reviewForm = (
      <div>
        <form className="review-form" onSubmit={handleFormSubmit}>
          <ErrorList errors={props.errors} />
          <h2>Add A Review</h2>
          <div>
            <label>Rating</label>
            <input
              name="rating"
              id="rating"
              type="number"
              min={1}
              max={5}
              value={formFields.rating}
              onChange={handleFieldChange}
            />
          </div>
          <div>
            <label>Difficulty</label>
            <input
              name="difficulty"
              id="difficulty"
              type="number"
              min={1}
              max={10}
              value={formFields.difficulty}
              onChange={handleFieldChange}
            />
          </div>
          <div>
            <label>Comment</label>
            <input
              name="comment"
              id="comment"
              type="text"
              value={formFields.comment}
              onChange={handleFieldChange}
            />
          </div>
          <div className="form-buttons">
            <div>
              <input type="submit" value="Submit New Review" />
            </div>
            <div>
              <input type="button" value="Clear Form" onClick={clearForm} />
            </div>
          </div>
        </form>
      </div>
    );
  } else {
    reviewForm = <h3>Please Sign Up or Sign In to add a review!</h3>;
  }

  return <div>{reviewForm}</div>;
};

export default ReviewFormContainer;
