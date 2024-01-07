input:0:"21.input"

pad:{ x.-1+2#,!2+#x }
visited:"S"=map:pad input
map:("S.#"!"..#") map
cross:(0 1 0; 1 0 1; 0 1 0)
nb:{ map. (x-1)+\:!3 }

"part 1"

limit:64
mark:{[step;x] visited::.[visited;(x-1)+\:!3;|;step*cross&"."=nb x] }
+//visited=limit { mark[x+1]'+&x=visited; x+1 }/1

"part 2"

map:pad input[a;a:,/9#,!#input]
map:("S.#"!"..#") map

center:2#_(#map)%2

visited:0&map
visited:.[visited;center;:;1]

"-- limit"
:limit:26501365

height:width:#input
"-- how many copies"
copies:(-width)!1+2*limit
//use next odd number
:copies:1+2*_copies%2
"-- use this limit for calculation of circumference"
:limit:(3*width)+width!limit
"-- use this number for calculation of innards"
:i:copies+2-6
"-- use this number for calculation of side parts"
:s:_i%2

"-- dance! (this is slow)"
{ mark[x+1]'+&x=visited; \x }'1+!limit;

// always use 9 copies for calculating circumference - too much?
origo:center-((_(width-1)%2)+(_(9-1)%2)*width)

part1:{[y;x;w] visited. origo+((y*height)+!(height);(x*width)+!(w*width))}
part:{+//(limit+1)=part1[x;y;z]}

/* "-- top1, top3, top5, left, right, bottom5, bottom3, bottom1" */
other:part./:(0 4 1;1 3 3;2 2 5;4 0 3;4 6 3;6 2 5;7 3 3;8 4 1)
/* "-- tlside, blside, brside, trside" */
sides:part./:(3 1 3;5 1 3;5 5 3;3 5 3)

saturated1:part. 4 4 1
saturated2:part. 4 5 1

innards:{
    m:_z%2
    n:m+1
    (x*m*m)+(y*n*n) }

"-- calculated result"
(+/other)+(s*(+/sides))+innards[saturated1;saturated2] i
