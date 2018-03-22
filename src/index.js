import React from "react";
import ReactDOM from "react-dom";
import {BrowserRouter} from "react-router-dom";

import {createStore} from "redux";
import {Provider} from "react-redux";

import AppShell from "./components/AppShell";
import "./index.css";

const store = createStore(() => ({
  example: "My React Demo",
}));

const Root = () => (
  <Provider store={store}>
    <BrowserRouter>
      <AppShell />
    </BrowserRouter>
  </Provider>
);

ReactDOM.render(<Root />, document.getElementById('root'));
