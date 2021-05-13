import React, { useState, useEffect } from "react";
import BeerTile from "./BeerTile";
import BeerFormContainer from "./BeerFormContainer";

const BeerIndex = (props) => {
  const [beers, setBeers] = useState([]);
  const [currentUser, setCurrentUser] = useState({});

  const fetchBeers = async () => {
    try {
      const response = await fetch("/api/v1/beers");
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`;
        const error = new Error(errorMessage);
        throw error;
      }
      const beerResponseBody = await response.json();
      setBeers(beerResponseBody.beer);
      setCurrentUser(beerResponseBody.currentUser);
    } catch (err) {
      console.error("Error in fetch!");
      console.error(err);
    }
  };

  useEffect(() => {
    fetchBeers();
  }, []);

  const addNewBeer = async (formPayload) => {
    try {
      const newBeerResponse = await fetch("/api/v1/beers", {
        method: "POST",
        credentials: "same-origin",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: JSON.stringify(formPayload),
      });
      if (newBeerResponse.ok) {
        const parsedBeerResponse = await newBeerResponse.json();
        setbeers([...beers, parsedBeerResponse]);
      }
      if (newBeerResponse.status === 401 || newBeerResponse.status === 422) {
        const errorMessage = await newBeerResponse.json();
        setErrors({ error: errorMessage.error });
      }
      const error = new Error(`${newBeerResponse.status}: ${newBeerResponse.statusText}`);
      throw error;
    } catch (error) {
      console.error(`Error in fetch: ${error.message}`);
    }
  };

  const beerList = beers.map((beer) => {
    return (
      <BeerTile
        key={beer.id}
        id={beer.id}
        name={beer.name}
        description={beer.description}
        abv={beer.abv}
        image={beer.image_url}
        ibu={beer.ibu}
        ph={beer.ph}
        beerVolumeValue={beer.beer_volume_value}
        beerVolumeUnit={beer.beer_volume_unit}
        boilVolumeValue={beer.boil_volume_value}
        boilVolumeUnit={beer.boil_volume_unit}
      />
    );
  });

  return (
    <div>
      <h1 className="index-title">Select a Homebrewing Recipe!</h1>
      <ul>{beerList}</ul>
      <BeerFormContainer addNewBeer={addNewBeer} />
    </div>
  );
};

export default BeerIndex;
