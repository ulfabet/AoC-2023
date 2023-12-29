input:0:"21.input"
/* input:0:"examples/21.input" */

pad:{ x.-1+2#,!2+#x }
input:pad input
visited:"S"=input
input:("S.#"!"..#") input
cross:(0 1 0; 1 0 1; 0 1 0)
nb:{ input. (x-1)+\:!3 }

"part 1"

limit:64
mark:{[step;x] visited::.[visited;(x-1)+\:!3;|;step*cross&"."=nb x] }
+//visited=limit { mark[x+1]'+&x=visited; x+1 }/1
