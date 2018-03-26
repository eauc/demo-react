import * as api from "../api/tasks";

export function fetchTasks() {
  return (dispatch) => {
    dispatch({type: "TASKS_FETCH_ENTRIES"});
    return api.fetchTasks()
      .then(({entries}) => {
	dispatch({type: "TASKS_SET_ENTRIES", entries});
      });
  };
}
