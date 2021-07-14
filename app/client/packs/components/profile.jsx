import React from "react";
import ReactDOM from "react-dom";
import PropTypes from "prop-types";

class Profile extends React.Component {
  render() {
    return <p>Profile</p>;
  }
}

document.addEventListener("DOMContentLoaded", () => {
  const app = document.getElementById("profile");
  app && ReactDOM.render(<Profile />, app);
});
