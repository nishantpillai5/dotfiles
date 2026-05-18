import { ifDevice, map, rule } from "karabiner.ts";

export const backspace = [
  rule(
    "Caps Lock → Backspace",
    ifDevice({ is_built_in_keyboard: true }),
  ).manipulators([map("⇪").to("delete_or_backspace")]),
];
