input:0:"3.input"

"part 1"

numbers:,/$!10
valid:numbers," ."
coords:+&|/{x=input}'numbers
split:&{~x[1]=1+y[1]}':coords
groups:split_coords
validate:{ |//^valid?input.(*x)+(!3;!2+#x)-1 }
+/`I$(input./:)'groups@&validate'groups

"part 2"

stars:{ (*x-1)+&~^(,"*")?input.(*x)+(!3;!2+#x)-1 }
+/{*/`I$(input./:)'groups@x}'sg@&2=#'sg:=stars'groups

\\
