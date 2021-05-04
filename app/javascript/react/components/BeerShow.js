import React, { useState, useEffect } from "react";

const BeerShow = (props) => {
  const [beer, setBeer] = useState([]);

  const fetchBeer = async () => {
    try {
      let beerId = props.match.params.id;
      const response = await fetch(`/api/v1/beers/${beerId}`);
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`;
        throw new Error(errorMessage);
      }

      const responseBody = await response.json();
      setBeer(responseBody);
    } catch (error) {
      console.error(`Error in Fetch: ${error.message}`);
    }
  };
  useEffect(() => {
    fetchBeer();
  }, []);

  return (
    <div>
      <h1>{beer.name}</h1>
      <img claassName="show-page-image" src={beer.image_url}></img>
      <p>About this Beer: {beer.description}</p>
      <h2>Beer Stats and Brewing Instructions</h2>
      <ul>
        <li>abv: {beer.abv}</li>
        <li>ibu: {beer.ibu}</li>
        <li>ph: {beer.ph}</li>
      </ul>
    </div>
  );
};

export default BeerShow;
