
import React from "react";
import ReactDOM from "react-dom";
import {login, logout, signup} from "./util/session_api_util";
import configureStore from './store/store';

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    

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
    window.store = store;

    ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});