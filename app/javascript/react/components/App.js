import React from "react";
import { BrowserRouter, Route, Switch } from "react-router-dom";
import BeerIndex from "./BeerIndex";
import BeerShow from "./BeerShow";

export const App = (props) => {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path="/" component={BeerIndex} />
        <Route exact path="/beers/:id" component={BeerShow} />
      </Switch>
    </BrowserRouter>
  );
};

export default App;
