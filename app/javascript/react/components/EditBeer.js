import React from "react";

const EditBeer = (props) => {
  let editBeer;
  if (props.currentUser.role === "admin" && props.currentUser.id) {
    editBeer = <a href={`/beers/${props.beerId}/edit`}>Edit this beer</a>;
  }

  return <div className="edit">{editBeer}</div>;
};

export default EditBeer;
