import React from "react";
import {Navbar, Nav, NavItem} from "react-bootstrap";
import {LinkContainer} from "react-router-bootstrap";

export default () => (
  <Navbar>
    <Navbar.Header>
      <Navbar.Brand>
	React Demo
      </Navbar.Brand>
    </Navbar.Header>
    <Nav>
      <LinkContainer to="/">
	<NavItem>Home</NavItem>
      </LinkContainer>
      <LinkContainer to="/test">
	<NavItem>Test</NavItem>
      </LinkContainer>
    </Nav>
  </Navbar>
);
