import React from "react";

const BeerTile = (props) => {
  return (
    <div className="grid-x grid-margin-x">
      <div className="callout secondary cell small-12 medium-4 text-center">
        <div className="card beer-card">
          <div className="card-section">
            <h3>{props.name}</h3>
          </div>
        </div>
      </div>
    </div>
  );
};

export default BeerTile;
