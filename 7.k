input:0:"7.input"

"part 1"

convert:"AKQJT9876543210 "!"EDCBA9876543210 "
types:(5; 4 1; 3 2; 3 1 1; 2 2 1; 2 1 1 1; 1 1 1 1 1)
type:{ d:#'=x; t:d[>d]; *&(t~)'types }
hand:{ *" "\x }
bid:{ `I$*1_" "\x }

i:i@>i:(convert@)'input
order:<type'hand'i
+/(|1+!#i)*bid'i@order

"part 2"

expand:{ $[~^(x?"1"); ,/({x[x?"1"]:y; expand x} x)'13#.convert; ,x] }

jokers:convert
jokers["J"]:"1"

i:i@>i:(jokers@)'input
order:<{&/type'expand x}'hand'i
+/(|1+!#i)*bid'i@order

\\
