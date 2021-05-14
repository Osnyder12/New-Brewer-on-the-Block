import React, { useState } from "react";
import _ from "lodash";
import IngredientsFormContainer from "./IngredientsFormContainer";
import ErrorList from "./ErrorList";
import { Redirect } from "react-router";

const BeerFormContainer = (props) => {
  const [errors, setErrors] = useState({});
  const [formFields, setFormFields] = useState({
    name: "",
    description: "",
    abv: "",
    image_url: "",
    ibu: "",
    ph: "",
    beer_volume_value: "",
    beer_volume_unit: "",
    boil_volume_value: "",
    boil_volume_unit: "",
    mash_temp_value: "",
    mash_temp_unit: "",
    mash_temp_duration: "",
    fermentation_value: "",
    fermentation_unit: "",
  });

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

  const handleFieldChange = (event) => {
    setFormFields({
      ...formFields,
      [event.currentTarget.name]: event.currentTarget.value,
    });
  };

  const handleFormSubmit = (event) => {
    event.preventDefault();
    addNewBeer(formFields);
    setFormFields({
      name: "",
      description: "",
      abv: "",
      image_url: "",
      ibu: "",
      ph: "",
      beer_volume_value: "",
      beer_volume_unit: "",
      boil_volume_value: "",
      boil_volume_unit: "",
      mash_temp_value: "",
      mash_temp_unit: "",
      mash_temp_duration: "",
      fermentation_value: "",
      fermentation_unit: "",
    });
  };

  const clearForm = (event) => {
    event.preventDefault();
    setFormFields({
      name: "",
      description: "",
      abv: "",
      image_url: "",
      ibu: "",
      ph: "",
      beer_volume_value: "",
      beer_volume_unit: "",
      boil_volume_value: "",
      boil_volume_unit: "",
      mash_temp_value: "",
      mash_temp_unit: "",
      mash_temp_duration: "",
      fermentation_value: "",
      fermentation_unit: "",
    });
  };

  return (
    <div>
      <h1>Add a new beer recipe!</h1>
      <form onSubmit={handleFormSubmit}>
        <div>
          <label>Name:</label>
          <input
            name="name"
            id="name"
            type="text"
            value={formFields.name}
            onChange={handleFieldChange}
          />
        </div>
        <div>
          <label>Description:</label>
          <input
            name="description"
            id="description"
            type="text"
            value={formFields.description}
            onChange={handleFieldChange}
          />
        </div>
        <div>
          <label>ABV:</label>
          <input
            name="abv"
            id="abv"
            type="number"
            value={formFields.abv}
            onChange={handleFieldChange}
          />
        </div>
        <div>
          <label>Beer Image:</label>
          <input
            name="image_url"
            id="image_url"
            type="text"
            value={formFields.image_url}
            onChange={handleFieldChange}
          />
        </div>
        <div>
          <label>IBU:</label>
          <input
            name="ibu"
            id="ibu"
            type="number"
            value={formFields.ibu}
            onChange={handleFieldChange}
          />
        </div>
        <div>
          <label>PH:</label>
          <input
            name="ph"
            id="ph"
            type="number"
            value={formFields.ph}
            onChange={handleFieldChange}
          />
        </div>
        <div>
          <label>Final Beer Volume:</label>
          <input
            name="beer_volume_value"
            id="beer_volume_value"
            type="number"
            value={formFields.beer_volume_value}
            onChange={handleFieldChange}
          />
        </div>
        <div>
          <label>Final Volume Unit:</label>
          <input
            name="beer_volume_unit"
            id="beer_volume_unit"
            type="text"
            value={formFields.beer_volume_unit}
            onChange={handleFieldChange}
          />
        </div>
        <div>
          <label>Starting Water Volume:</label>
          <input
            name="boil_volume_value"
            id="boil_volume_value"
            type="number"
            value={formFields.boil_volume_value}
            onChange={handleFieldChange}
          />
        </div>
        <div>
          <label>Water Volume Unit:</label>
          <input
            name="boil_volume_unit"
            id="boil_volume_unit"
            type="text"
            value={formFields.boil_volume_unit}
            onChange={handleFieldChange}
          />
        </div>
        <div>
          <label>Mash Temp:</label>
          <input
            name="mash_temp_value"
            id="mash_temp_value"
            type="number"
            value={formFields.mash_temp_value}
            onChange={handleFieldChange}
          />
        </div>
        <div>
          <label>Mash Temp Unit:</label>
          <input
            name="mash_temp_unit"
            id="mash_temp_unit"
            type="text"
            value={formFields.mash_temp_unit}
            onChange={handleFieldChange}
          />
        </div>
        <div>
          <label>Boil Duration:</label>
          <input
            name="mash_temp_duration"
            id="mash_temp_duration"
            type="number"
            value={formFields.mash_temp_duration}
            onChange={handleFieldChange}
          />
        </div>
        <div>
          <label>Fermentation Temperature:</label>
          <input
            name="fermentation_value"
            id="fermentation_value"
            type="number"
            value={formFields.fermentation_value}
            onChange={handleFieldChange}
          />
        </div>
        <div>
          <label>Fermentation Temperature Unit:</label>
          <input
            name="fermentation_unit"
            id="fermentation_unit"
            type="text"
            value={formFields.fermentation_unit}
            onChange={handleFieldChange}
          />
        </div>
        <div>
          <input type="submit" value="Submit New Recipe" />
        </div>
        <div>
          <input className="alert button" type="button" value="Clear Form" onClick={clearForm} />
        </div>
      </form>
    </div>
  );
};

export default BeerFormContainer;
