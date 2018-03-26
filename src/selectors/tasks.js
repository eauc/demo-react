import * as R from "ramda";
import {createSelector} from "reselect";

export const getTasksList = createSelector(
  R.path(["tasks", "entries"]),
  R.values
);
