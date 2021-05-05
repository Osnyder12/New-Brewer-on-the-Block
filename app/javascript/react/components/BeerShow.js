import React, { useState, useEffect } from "react";
import ReviewFormContainer from "./ReviewFormContainer";
import ReviewsContainer from "./ReviewsContainer";

const BeerShow = (props) => {
  const [beer, setBeer] = useState({});
  const [reviews, setReviews] = useState([]);
  const [errors, setErrors] = useState({});

  let beerId = props.match.params.id;

  const fetchBeer = async () => {
    try {
      const response = await fetch(`/api/v1/beers/${beerId}`);
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`;
        throw new Error(errorMessage);
      }

      const parsedBeerResponse = await response.json();
      setBeer(parsedBeerResponse.beer);
      setReviews(parsedBeerResponse.reviews);
    } catch (error) {
      console.error(`Error in Fetch: ${error.message}`);
    }
  };
  useEffect(() => {
    fetchBeer();
  }, []);

  const addNewReview = async (formPayload) => {
    try {
      const reviewResponse = await fetch(`/api/v1/beers/${beerId}/reviews`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: JSON.stringify(formPayload),
      });
      if (reviewResponse.ok) {
        const parsedReviewResponse = await reviewResponse.json();
        setReviews([...reviews, parsedReviewResponse]);
      }
      if (reviewResponse.status === 401 || reviewResponse.status === 422) {
        const errorMessage = await reviewResponse.json();
        setErrors({ error: errorMessage.error });
      }
      const error = new Error(`${reviewResponse.status}: ${reviewResponse.statusText}`);
      throw error;
    } catch (error) {
      console.error(`Error in fetch: ${error.message}`);
    }
  };

  return (
    <div>
      <h1>{beer.name}</h1>
      <img className="show-page-image" src={beer.image_url}></img>
      <p>About this Beer: {beer.description}</p>
      <h2>Beer Stats and Brewing Instructions</h2>
      <ul>
        <li>abv: {beer.abv}</li>
        <li>ibu: {beer.ibu}</li>
        <li>ph: {beer.ph}</li>
      </ul>
      <div>
        <ReviewFormContainer addNewReview={addNewReview} setErrors={setErrors} errors={errors} />
        <ReviewsContainer reviews={reviews} setReviews={setReviews} />
      </div>
    </div>
  );
};

export default BeerShow;
