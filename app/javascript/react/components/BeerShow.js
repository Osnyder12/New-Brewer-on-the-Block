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
    </div>
  );
};

export default BeerShow;
