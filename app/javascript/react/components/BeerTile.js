import React from "react";
import { Link } from "react-router-dom";

const BeerTile = (props) => {
  return (
    <div>
      <Link to={`/beers/${props.id}`}>
        <div className="column-4">
          <h3 className="beer-text">{props.name}</h3>
        </div>
      </Link>
    </div>
  );
};

export default BeerTile;
