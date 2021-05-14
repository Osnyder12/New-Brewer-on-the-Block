import React, { useState, useEffect } from "react";
import BeerTile from "./BeerTile";
import { Link } from "react-router-dom";

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
      setCurrentUser(beerResponseBody.current_user);
    } catch (err) {
      console.error("Error in fetch!");
      console.error(err);
    }
  };

  useEffect(() => {
    fetchBeers();
  }, []);

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

  // let newRecipeLink = null;
  // if (currentUser.role === "admin") {
  //   newRecipeLink = <Link to="/beers/new">Add a new starter recipe</Link>;
  // }

  return (
    <div>
      <h1 className="index-title">Select a Homebrewing Recipe!</h1>
      <ul>{beerList}</ul>
      <Link to="/beers/new">Add a new starter recipe</Link>;
    </div>
  );
};

export default BeerIndex;
