import React from "react";

const EditBeer = (props) => {
  let editBeer;
  if (props.beer.user_id === props.currentUser.id) {
    editBeer = <a href={`/beers/${props.beerId}/edit`}>Edit your beer</a>;
  }

  return <div className="edit">{editBeer}</div>;
};

export default EditBeer;
