import React from "react";
import ReactDOM from "react-dom";

import {createStore} from "redux";
import {Provider} from "react-redux";

import App from "./App";
import "./index.css";

const store = createStore(() => ({
  example: "My React Demo",
}));

const Root = () => (
    <Provider store={store}>
    <App />
    </Provider>
);

ReactDOM.render(<Root />, document.getElementById('root'));
