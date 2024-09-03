local colors = require("colors")
-- Require the sketchybar module
SBAR = require("sketchybar")
sbar = SBAR

-- Bundle the entire initial configuration into a single message to sketchybar
sbar.begin_config()

require("bar")
require("default")
require("items")
require("brackets")

sbar.end_config()

-- Run the event loop of the sketchybar module (without this there will be no
-- callback functions executed in the lua module)
sbar.event_loop()
