import { writeToProfile } from "karabiner.ts";

import { backspace } from "./backspace.ts";
import { homerowMods } from "./homerowMods.ts";

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
