
import React from "react";
import ReactDOM from "react-dom";
import {login, logout, signup} from "./util/session_api_util";
import configureStore from './store/store';
import Root from "./components/root";

document.addEventListener("DOMContentLoaded", () => {
    let preloadedState = undefined;
    if (window.currentUser) {
        preloadedState = {
          session: {
            currentUser: window.currentUser
          }
        };
    }
    const store = configureStore(preloadedState);

    window.login = login;
    window.logout = logout;
    window.signup = signup;
    window.dispatch = store.dispatch;
    const root = document.getElementById("root");
    ReactDOM.render(<Root store={store} />, root);
});