input:0:"16.input"

"part 1"

tiles:0&input

void:{ () }
pass:{ ,x }
slash:{ ,-|x  }
backslash:{ ,|x  }
pipe:{ $[ x[0]; ,x; (-|x;|x) ] }
hyphen:{ $[ x[1]; ,x; (-|x;|x) ] }

reflect:" ./\\|-"!(void;pass;slash;backslash;pipe;hyphen)

next:{[ray]
    (p;v):ray
    $[ (&/^tiles. p)|(v~tiles. p); :(); energize ray ]
    {[p;v] (p+v;v)}[p]'reflect[input. p] v }

energize:{[ray]
    (p;v):ray
    tiles::.[tiles;p;:;v] }

trace:{[rays] ,/next'rays }

trace/,(0 0;0 1);
+//~0~''tiles

"part 2"

n:#input
top:|''left:{((x;0);0 1)}'!n
bottom:|''right:{((x;n-1);0 -1)}'!n

|/{ tiles::0&input; trace/,x; +//~0~''tiles }'top,left,bottom,right
