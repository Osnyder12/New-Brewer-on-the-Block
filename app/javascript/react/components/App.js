import React from "react";
import { BrowserRouter, Route, Switch } from "react-router-dom";
import BeerOurBeers from "./BeerOurBeers";
import BeerExternalBeer from "./BeerExternalBeer";
import BeerShow from "./BeerShow";
import PunkBeerShow from "./PunkBeerShow";

export const App = (props) => {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path="/beers" component={BeerOurBeers} />
        <Route exact path="/beers/:id" component={BeerShow} />
        <Route exact path="/punk_beers" component={BeerExternalBeer} />
        <Route exact path="/punk_beers/:id" component={PunkBeerShow} />
        <Route exact path="/beers/:id" component={BeerShow} />
      </Switch>
    </BrowserRouter>
  );
};

export default App;
