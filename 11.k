input:0:"11.input"

"part 1"

abs:{ |/(-x;x) }
distance:{+/abs'y-x}
expand:{x@,/({$[^x?y;y;y,y]} (&&/'"."=x))'!#x}
coords:+&"#"=+expand@+expand input
all:coords distance\:/: coords
+//all*{x<\:x}@!#all

"part 2"

empty:&&/'"."=
rows:empty@input
cols:empty@+input
expansion:1000000-1
coords:+&"#"=input
coords:coords {({ $[x<y 0; y+expansion,0; y] }y)'x}/|rows
coords:coords {({ $[x<y 1; y+0,expansion; y] }y)'x}/|cols
all:coords distance\:/: coords
+//all*{x<\:x}@!#all

\\
