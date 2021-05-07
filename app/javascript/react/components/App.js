import React from "react";
import { BrowserRouter, Route, Switch } from "react-router-dom";
import BeerIndex from "./BeerIndex";
import PunkBeerIndex from "./PunkBeerIndex";
import BeerShow from "./BeerShow";

export const App = (props) => {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path="/beers" component={BeerIndex} />
        <Route exact path="/beers/:id" component={BeerShow} />
        <Route exact path="/punk_beers" component={PunkBeerIndex} />
        <Route exact path="/punk_beers/:id" component={BeerShow} />
      </Switch>
    </BrowserRouter>
  );
};

export default App;
