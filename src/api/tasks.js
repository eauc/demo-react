import * as R from "ramda";
import faker from "faker";
import {v4} from "node-uuid";

let FAKE_DATA =  R.pipe(
  R.times(() => {
    return {
      id: v4(),
      title: faker.lorem.words(),
      description: faker.lorem.sentences(),
    };
  }),
  R.map((entry) => {
    return [entry.id, entry];
  }),
  R.fromPairs
)(5);
export function fetchTasks() {
  return new Promise((resolve) => {
    setTimeout(resolve, 1000);
  }).then(() => {
    return {
      entries: FAKE_DATA,
    };
  });
}
