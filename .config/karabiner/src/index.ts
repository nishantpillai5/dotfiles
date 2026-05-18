import { writeToProfile } from "karabiner.ts";

import { backspace } from "./backspace";
import { homerowMods } from "./homerowMods";

writeToProfile(
  "default",
  [
    ...backspace,
    ...homerowMods,
  ],
  {
    "basic.to_if_held_down_threshold_milliseconds": 150,
  },
);
