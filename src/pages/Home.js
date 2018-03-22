import React from "react";
import {connect} from 'react-redux';
import {Col, Grid, Row} from "react-bootstrap";

export const HomePage = ({example}) => (
  <Grid>
    <Row>
      <Col>
	Welcome to {example} !
      </Col>
    </Row>
  </Grid>
);

const mapStateToProps = (state) => ({
  example: state.example,
});

const mapDispatchToProps = (dispatch) => ({});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(HomePage);
