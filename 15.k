input:","\*0:"15.input"

"part 1"

hash:0 { 256!17*x+y }/
+/hash'input

"part 2"

box:()!()

update:{
    label:*a:"="\x
    fl:`I$*1_a 
    box[(hash label),label]:fl }

remove:{
    label:-1_x
    box::(,(hash label),label)_box }

{ $[ ^x?"-"; update x; remove x ] }'input;

group:=n:1+*'!box
+/,/{*/(n x;1+!#x;(.box) x)}'.group

\\
