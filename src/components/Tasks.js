import * as R from "ramda";
import React from "react";
import {connect} from "react-redux";
import actions from "../actions";
import {getTasksList} from "../selectors/tasks";

const Task = ({title}) => (
  <tr>
    <td>{title}</td>
  </tr>
);
const TasksList = ({tasksList}) => (
  <table>
    <tbody>
      {R.map(([id, task]) => (
	<Task key={id} {...task}/>
      ), R.toPairs(tasksList))}
  </tbody>
    </table>
);
function mapStateToProps(state) {
  return {
    tasksList: getTasksList(state),
  };
}

const TasksListContainer = connect(
  mapStateToProps,
  actions
)(TasksList);

export default TasksListContainer;
