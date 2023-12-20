input:0:"19.input"
input:0:"examples/19.input"

input,:(,"")

offset:0
consume:{ r:x#offset_input; offset+:x; r }
list:{ $[""~ln:*consume 1; (); (,ln),list()] }

parseRule:{ b:*a:":"\x; $[ 1=#a; a; (b 0;b 1;`I$2_b;a 1)] }
parseRules:{ parseRule'","\x }

rules:()!()
rules[,"A"]:,,,"A"
rules[,"R"]:,,,"R"

tr:"xmas"!!4

workflow:{ a:"{"\x; rules[a 0]:parseRules -1_a 1 }
workflow'list();

parsePart:{ `I$","\x^"xmas={}" }
parts:parsePart'list()

d:"<>"!(<;>)
compare:{ d[y][x;z] }
// x = part, y = rule
apply:{ $[ 1=#y; y 0; $[ compare[x tr y 0;y 1;y 2]; y 3; 0N ] ] }
// x = workflow, y = part
process:{ *{^x}_(apply y)'rules[x] }

"part 1"

+//parts@*&"A"={{ process[x;y] }[;x]/"in"}'parts

"part 2"

next:{
    amin:bmin:x 3; amax:bmax:x 4; rule:y
    $[ 1=#rule; wf:rule 0; (i:tr rule 0; v:rule 2; wf:rule 3) ]
    $[ 1=#rule;; $[ "<"=rule 1; (amax[i]:v-1; bmin[i]:v); (amin[i]:v+1; bmax[i]:v) ] ]
    (wf;amin;amax;bmin;bmax) }

// x=workflow, y=low, z=high 
trace:{
    $[ (x~,"R"); y:z:0N; ]
    $[ (x~,"A")|(x~,"R"); (y;z); ,/trace.'3#'(0N;0N;0N;y;z) next\rules[x] ] }

+/*/'{1+y-x}.'0N 2#{^x}_trace["in";4#1;4#4000]
