import React from "react";

const IngredientsList = (props) => {
  let maltList = props.malts.map((malt) => {
    return (
      <li>
        {malt.name}: {malt.amount_value} {malt.amount_unit}
      </li>
    );
  });

  let hopStartList = props.hops.map((hop) => {
    if (hop.add_time == "start") {
      return (
        <div>
          <li>
            {hop.name}: {hop.amount_value} {hop.amount_unit}
          </li>
        </div>
      );
    }
  });
  let hopMiddleList = props.hops.map((hop) => {
    if (hop.add_time == "middle") {
      return (
        <div>
          <li>
            {hop.name}: {hop.amount_value} {hop.amount_unit}
          </li>
        </div>
      );
    }
  });
  let hopEndList = props.hops.map((hop) => {
    if (hop.add_time == "end") {
      return (
        <div>
          <li>
            {hop.name}: {hop.amount_value} {hop.amount_unit}
          </li>
        </div>
      );
    }
  });

  let yeastList = props.yeast.map((yeast) => {
    return <ul>1 packet of {yeast.name}</ul>;
  });

  return (
    <div className="ingredients-list">
      <h3>Malts:</h3>
      <ul>{maltList}</ul>
      <h3>Hops:</h3>
      <ul className="hop-list">
        <h4>Add at the start of the boiling process:</h4>
        {hopStartList}
        <h4>Add 15 minutes into the boiling process:</h4>
        {hopMiddleList}
        <h4>Add with 5 minutes left in the boiling process:</h4>
        {hopEndList}
      </ul>
      <h3>Yeast:</h3>
      {yeastList}
    </div>
  );
};

export default IngredientsList;
