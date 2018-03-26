import * as R from "ramda";

const DEFAULT_STATE = {
    "fetching": false,
    "entries": {}
};

export default function tasks(state = DEFAULT_STATE, {type, entries}) {
  switch(type) {
  case "TASKS_FETCH_ENTRIES":
    {
      return R.assoc("fetching", true, state);
    }
  case "TASKS_SET_ENTRIES":
    {
      return R.pipe(
        R.assoc("fetching", false),
        R.assoc("entries", entries)
      )(state);
    }
  default: {}
  };
  return state;
}
