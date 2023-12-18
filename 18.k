input:0:"18.input"

"part 1"

d:"UDLR"!((-1 0);(1 0);(0 -1);(0 1))

corners:{ x+y }
coords:(0 0) corners\{ (`I$x 1)*d(*x 0) }'" "\'input

abs:{ |/(-x;x) }
circumference:{ +//abs (*-1#x){ x-y }':x }
area:{ { abs x%2 }@+//(*-1#x){ (1 -1)*x*|y }':x }

_(1+(circumference coords)%2)+area coords

"part 2"

int:16/"0123456789abcdef"?/:
coords:(0 0) corners\{ y*d x }.'{ ("RDLU" `I$x[2;7];int x[2;2+!5]) }'" "\'input

_(1+(circumference coords)%2)+area coords
