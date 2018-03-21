import React from "react";
import {Col, Grid, Navbar, Row} from "react-bootstrap";
import "./App.css";

const App = () => (
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
    Welcome to my demo !
    </Col>
    </Row>
    </Grid>
    </div>
);

export default App;
