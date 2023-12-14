input:0:"14.input"

"part 1"

input:("O#."!"01.") input

sort:{ part:x@y; part(>part) }

roll:{
    walls:0,&"1"=x
    parts:walls_!#x
    ,/(sort x)'parts }

transform:`up`down`left`right!(+:;(|:;+:);::;|:')

tilt:{
    platform:y {y x}/transform x
    (roll'platform) {y x}/|transform x }

calc:{ +/(+/'"0"=x)*|1+!#x }
calc (tilt`up) input

"part 2"

result:200 { x { (tilt y) x }/`up`left`down`right }\input
floyd:{ $[ &//result[x]=result[y]; y-x; floyd[x+1;y+2] ] }
mu:floyd[1;2]
calc result@mu+mu!1000000000

\\
