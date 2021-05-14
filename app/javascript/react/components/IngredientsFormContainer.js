import React, { useState, Fragment } from "react";

const IngredientsFormContainer = (props) => {
  const [formFields, setFormFields] = useState([
    {
      ingredient_type: "",
      name: "",
      amount_value: "",
      amount_unit: "",
      add_time: "",
    },
  ]);

  const addNewIngredient = async (formPayload) => {
    try {
      const newIngredientResponse = await fetch(`/api/v1/beers/:beer_id/ingredients`, {
        method: "POST",
        credentials: "same-origin",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: JSON.stringify(formPayload),
      });
      if (newBeerResponse.ok) {
        debugger;
        const parsedIngredientResponse = await newIngredientResponse.json();
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
    setFormFields([
      {
        ...formFields,
        [event.currentTarget.name]: event.currentTarget.value,
      },
    ]);
  };

  const handleAddFields = () => {
    const values = [...formFields];
    values.push({ ingredient_type: "", name: "", amount_value: "", amount_unit: "", add_time: "" });
    setFormFields(values);
  };

  const handleRemoveFields = (index) => {
    const values = [...FormFields];
    values.splice(index, 1);
    setFormFields(values);
  };

  const handleFormSubmit = (event) => {
    event.preventDefault();
    addNewIngredient(formFields);
    setFormFields([
      {
        ingredient_type: "",
        name: "",
        amount_value: "",
        amount_unit: "",
        add_time: "",
      },
    ]);
  };

  const clearForm = (event) => {
    event.preventDefault();
    setFormFields({
      ingredient_type: "",
      name: "",
      amount_value: "",
      amount_unit: "",
      add_time: "",
    });
  };

  return (
    <div>
      <h2>Add Ingredients to your Recipe</h2>
      <form onSubmit={handleFormSubmit}>
        {formFields.map((formField, index) => (
          <Fragment key={`${formField}~${index}`}>
            <div>
              <label>Ingredient Type:</label>
              <input
                name="ingredient_type"
                id="ingredient_type"
                type="text"
                value={formFields.ingredient_type}
                onChange={handleFieldChange}
              ></input>
            </div>
            <div>
              <label>Ingredient Name:</label>
              <input
                name="name"
                id="name"
                type="text"
                value={formFields.name}
                onChange={handleFieldChange}
              ></input>
            </div>
            <div>
              <label>Amount:</label>
              <input
                name="amount_value"
                id="amount_value"
                type="number"
                value={formFields.amount_value}
                onChange={handleFieldChange}
              ></input>
            </div>
            <div>
              <label>Amount Unit:</label>
              <input
                name="amount_unit"
                id="amount_unit"
                type="text"
                value={formFields.amount_unit}
                onChange={handleFieldChange}
              ></input>
            </div>
            <div>
              <label>Add Time (hops):</label>
              <input
                name="add_time"
                id="add_time"
                type="text"
                value={formFields.add_time}
                onChange={handleFieldChange}
              ></input>
            </div>
            <div className="form-group col-sm-2">
              <button
                className="btn btn-link"
                type="button"
                onClick={() => handleRemoveFields(index)}
              >
                -
              </button>
              <button className="btn btn-link" type="button" onClick={() => handleAddFields()}>
                +
              </button>
            </div>
          </Fragment>
        ))}
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

export default IngredientsFormContainer;
