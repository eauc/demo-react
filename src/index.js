import React from "react";
import ReactDOM from "react-dom";
import {BrowserRouter} from "react-router-dom";

import {applyMiddleware, createStore, combineReducers, compose} from "redux";
import thunk from "redux-thunk";
import {Provider} from "react-redux";

import AppShell from "./components/AppShell";
import reducers from "./reducers";
import actions from "./actions";
import "./index.css";

const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
const store = createStore(
  combineReducers(reducers),
  composeEnhancers(applyMiddleware(
    thunk
  ))
);

const Root = () => (
  <Provider store={store}>
    <BrowserRouter>
      <AppShell />
    </BrowserRouter>
  </Provider>
);

ReactDOM.render(
    <Root />,
  document.getElementById('root'),
  () => { store.dispatch(actions.fetchTasks()); }
);
