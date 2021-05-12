import React from "react";

const IngredientsList = (props) => {
  let maltList = props.malts.map((malt) => {
    return (
      <li>
        {malt.name}: {malt.amount_value} {malt.amount_unit}
      </li>
    );
  });

  let hopList = props.hops.map((hop) => {
    return (
      <div>
        <li>
          {hop.name}: {hop.amount_value} {hop.amount_unit}
        </li>
        <p>
          Add {hop.name} in the {hop.add_time} of the brewing process.
        </p>
      </div>
    );
  });

  return (
    <ul>
      Malts:
      {maltList}
      Hops:
      {hopList}
    </ul>
  );
};

export default IngredientsList;
