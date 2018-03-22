import React from "react";
import {Route, Switch} from "react-router-dom";
import AppMenu from "./AppMenu";
import HomePage from "../pages/Home";
import TestPage from "../pages/Test";

export default () => (
  <div>
    <AppMenu />
    <Switch>
      <Route exact path="/" component={HomePage} />
      <Route exact path="/test" component={TestPage} />
    </Switch>
  </div>
);
