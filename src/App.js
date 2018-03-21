import React from "react";
import {connect} from 'react-redux';
import {Col, Grid, Navbar, Row} from "react-bootstrap";
import "./App.css";

export const App = ({example}) => (
  <div>
    <Navbar>
      <Navbar.Header>
	<Navbar.Brand>
	  React Demo
	</Navbar.Brand>
      </Navbar.Header>
    </Navbar>
    <Grid>
      <Row>
	<Col>
	  Welcome to {example} !
	</Col>
      </Row>
    </Grid>
  </div>
);

const mapStateToProps = (state) => ({
  example: state.example,
});

const mapDispatchToProps = (dispatch) => ({});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(App);
