import React from "react";
import { BrowserRouter, Route, Switch } from "react-router-dom";
import BeerIndex from "./BeerIndex";

export const App = (props) => {
  return (
    <BrowserRouter>
      <Route exact path="/" component={BeerIndex} />
    </BrowserRouter>
  );
};

export default App;
