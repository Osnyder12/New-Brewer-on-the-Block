import React from "react";

const InstructionsTile = (props) => {
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
    if (hop.add_time === "middle") {
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
    if (hop.add_time === "end") {
      return (
        <div>
          <li>
            {hop.name}: {hop.amount_value} {hop.amount_unit}
          </li>
        </div>
      );
    }
  });
  let hopStartString = "";
  if (hopStartList.length > 0) {
    hopStartString = " and your starting hops";
  }

  let hopMiddleString = "";
  if (hopMiddleList.length > 0) {
    debugger;
    hopMiddleString = " At 15 minutes into the boiling process, add your midway hops.";
  }

  let hopEndString = "";
  if (hopEndList.length > 0) {
    hopEndString = " , add final hops ";
  }

  return (
    <div>
      <h3>Brewing Instructions</h3>
      <li>
        In a 7 gallon pot, add {props.beer.boil_volume_value} {props.beer.boil_volume_unit} of
        water.
      </li>
      <li>
        Bring water temperature to {props.beer.mash_temp_value} degrees {props.beer.mash_temp_unit}{" "}
        and then add your malt ingredients into your metal strainer submerged in the water
        {hopStartString}.
      </li>
      <li>
        Stir the top 1/3rd of the mash every 10 minutes to prevent chunks and maintain a steady
        water flow through the mash.{hopMiddleString}
      </li>
      <li>
        Let the wort drain from the strainer into your 7 gallon pot{hopEndString}and allow to cool
        down to {props.beer.fermentation_value} degrees {props.beer.fermentation_unit}.
      </li>
      <li>
        Once cooled, transfer the wort into your 5 gallon fermentation tank with burper attached.
      </li>
      <li>
        Add yeast to fermentation tank and allow to ferment for 4-7 days. Transfer to bottles or a
        keg and enjoy after an additional 14 days!
      </li>
    </div>
  );
};

export default InstructionsTile;
