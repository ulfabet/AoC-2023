input:0:"22.input"

parse:{ `I$","\'"~"\x }

overlap:{[a;b] &/2#~((&/a)|(&/b))>((|/a)&(|/b)) }

add:{
    diff:(0 0 1)*(&/x)-|/|/tower@&overlap[x]'tower
    tower,:,x-\:diff-(0 0 1) }

zmax:{ |/x[;2] } 
zmin:{ &/x[;2] } 

canDisintegrate:{
    above:tower@&(1+zmax x)=zmin'tower
    $[ #above; above:above@&overlap[x]'above; ]
    below:{b@&overlap[x]'b:tower@&((zmin x)-1)=zmax'tower}'above
    below:{y^,x}[x]'below
    &/1,#'below }

"part 1"

bricks:parse'input
tower:,base:(0 0 0;(1 1 0)*|/|/bricks)
add'bricks[<zmin'bricks];
+/canDisintegrate'tower

"part 2"

key:,/
prev:next:()!()

graph:{
    above:tower@&(1+zmax x)=zmin'tower
    $[ #above; above@:&overlap[x]'above; ]
    next[key x]:above
    { prev[y]:$[ ^(!prev)?y; ,x; prev[y],,x] }[x]'key'above }

count:{
    wouldFall:{ 0=#(prev key y)^x }
    $[ #y;; :0 ]
    new:y@&wouldFall[x]'y
    (#new)+/o[x,new;?,/next@key'new] }

chainReactions:{ count[,x;next key x] }

graph'1_tower;

+/chainReactions'1_tower
