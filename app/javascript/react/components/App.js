import React from "react";
import { BrowserRouter, Route, Switch } from "react-router-dom";
import BeerIndex from "./BeerIndex";
import ExternalBeerIndex from "./ExternalBeerIndex";
import BeerShow from "./BeerShow";
import ExternalBeerShow from "./ExternalBeerShow";

export const App = (props) => {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path="/beers" component={BeerIndex} />
        <Route exact path="/beers/:id" component={BeerShow} />
        <Route exact path="/external_beers" component={ExternalBeerIndex} />
        <Route exact path="/external_beers/:id" component={ExternalBeerShow} />
        <Route exact path="/beers/:id" component={BeerShow} />
      </Switch>
    </BrowserRouter>
  );
};

export default App;
