import { parse } from "@babel/core";
import React, { useState, useEffect } from "react";
import IngredientsList from "./IngredientsList";
import ReviewFormContainer from "./ReviewFormContainer";
import ReviewsContainer from "./ReviewsContainer";
import InstructionsTile from "./InstructionsTile";

const PunkBeerShow = (props) => {
  const [beer, setBeer] = useState({});
  const [malts, setMalts] = useState([]);
  const [hops, setHops] = useState([]);
  const [yeast, setYeast] = useState([]);
  const [reviews, setReviews] = useState([]);
  const [currentUser, setCurrentUser] = useState({});
  const [errors, setErrors] = useState({});

  let beerId = props.match.params.id;

  const fetchBeer = async () => {
    try {
      const response = await fetch(`/api/v1/punk_beers/${beerId}`);
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`;
        throw new Error(errorMessage);
      }

      const parsedBeerResponse = await response.json();
      setBeer(parsedBeerResponse.punk_beer);
      setMalts(parsedBeerResponse.malts);
      setHops(parsedBeerResponse.hops);
      setYeast(parsedBeerResponse.yeast);
      setReviews(parsedBeerResponse.reviews);
      setCurrentUser(parsedBeerResponse.current_user);
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
        credentials: "same-origin",
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

  const deleteReview = async (reviewId) => {
    try {
      const deleteResponse = await fetch(`/api/v1/beers/${beerId}/reviews/${reviewId}`, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: JSON.stringify({ id: reviewId }),
      });
      if (deleteResponse.ok) {
        const parsedDeleteResponse = await deleteResponse.json();

        if (!parsedDeleteResponse.error) {
          let remainingReviews = reviews.filter((existingReview) => existingReview.id !== reviewId);
          return setReviews([...remainingReviews]);
        } else {
          return console.log(parsedDeleteResponse.error);
        }
      }
      const error = new Error(`${deleteResponse.status}: ${deleteResponse.statusText}`);
      throw error;
    } catch (error) {
      console.error(`Error in fetch: ${error.message}`);
    }
  };

  return (
    <div>
      <h1>{beer.name}</h1>
      <div className="column-7">
        <img className="show-page-image" src={beer.image_url}></img>
      </div>
      <div className="column-7">
        <p>About this Beer: {beer.description}</p>
      </div>
      <div className="beer-information">
        <h2>Beer Stats and Brewing Instructions</h2>
        <ul>
          <li>abv: {beer.abv}</li>
          <li>ibu: {beer.ibu}</li>
          <li>ph: {beer.ph}</li>
        </ul>
      </div>
      <div>
        <IngredientsList beer={beer} malts={malts} hops={hops} yeast={yeast} />
      </div>
      <div>
        <InstructionsTile beer={beer} malts={malts} hops={hops} yeast={yeast} />
      </div>
      <div>
        <ReviewFormContainer
          addNewReview={addNewReview}
          setErrors={setErrors}
          errors={errors}
          currentUser={currentUser}
        />
        <ReviewsContainer
          reviews={reviews}
          setReviews={setReviews}
          currentUser={currentUser}
          deleteReview={deleteReview}
        />
      </div>
    </div>
  );
};

export default PunkBeerShow;
