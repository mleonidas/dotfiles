hs.loadSpoon("WindowHalfsAndThirds")

obj = {}
obj.mapping = {
   left_half       = { {"ctrl",        "cmd"}, "h" },
   right_half      = { {"ctrl",        "cmd"}, "l" },
   top_half        = { {"ctrl",        "cmd"}, "Up" },
   bottom_half     = { {"ctrl",        "cmd"}, "j" },
   left_two_third  = { {"ctrl",        "cmd"}, ";" },
   right_two_third =  { {"ctrl",        "cmd"}, "'" },
   third_right     = { {"ctrl",        "alt"}, "Right" },
   third_up        = { {"ctrl",        "cmd"}, "k" },
   third_down      = { {"ctrl",        "alt"}, "Down" },
   top_left        = { {"ctrl",        "cmd"}, "1" },
   top_right       = { {"ctrl",        "cmd"}, "2" },
   bottom_left     = { {"ctrl",        "cmd"}, "3" },
   bottom_right    = { {"ctrl",        "cmd"}, "4" },
   max             = { {"ctrl",        "cmd"}, "f" },
   undo            = { {        "alt", "cmd"}, "z" },
   center          = { {        "alt", "cmd"}, "c" },
   larger          = { {        "alt", "cmd", "shift"}, "Right" },
   smaller         = { {        "alt", "cmd", "shift"}, "Left" },
}
spoon.WindowHalfsAndThirds:bindHotkeys(obj.mapping)
