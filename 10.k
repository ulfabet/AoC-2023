input:0:"10.input"

"part 1"

delta:`up`down`left`right!(-1 0;1 0;0 -1;0 1)
possible:"S|-F7LJ"!(`up`down`left`right; `up`down; `left`right; `down`right; `down`left; `up`right; `up`left)
steps:{ x+/:delta possible input .x }
firststep:{ 1#a@&~^("|F7";"|LJ";"-FL";"-7J")?'(input./:a:steps x) }
trace:{ next:steps[*-1#x]^((1#x),-2#x); $[ #next; x,1#next; x ] }

path:(,s),firststep s:(,/&"S"=input)
coords:trace/path

_(#coords)%2

"part 2"

abs:{ |/(-x;x) }
area:{ { abs x%2 }@+//(*-1#x){ (1 -1)*x*|y }':x }
vertices:coords@&~^(,/{+&x=input}'"F7LJS")?coords

_1+(area vertices)-(#coords)%2

\\
