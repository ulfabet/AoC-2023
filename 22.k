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
