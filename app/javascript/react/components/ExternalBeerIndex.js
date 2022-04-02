import React, { useState, useEffect } from "react";
import ExternalBeerShow from "./ExternalBeerShow";
import PunkBeerTile from "./PunkBeerTile";

const ExternalBeerIndex = (props) => {
  const [beers, setBeers] = useState([]);

  const fetchBeers = async () => {
    try {
      const response = await fetch("/api/v1/external_beers");
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`;
        const error = new Error(errorMessage);
        throw error;
      }
      const beerResponseBody = await response.json();
      debugger;
      setBeers(beerResponseBody);
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
      <PunkBeerTile
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
    </div>
  );
};

export default ExternalBeerIndex;
