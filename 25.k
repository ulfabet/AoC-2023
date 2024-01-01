input:0:"25.input"

growsets:{
    (a;b):{[g;set] ?set,/g(_(#set)%-2)?set}[graph]'x
    (a;b)^\:a{^x}_a?b }

links:{[a;b]
    +/{[set;component] #{^x}_{x?y}[set]'graph[component]}[a]'b}

result:{[a;b]
    remaining:(!graph)^a,b
    *//#''sets@&3=links.'sets:((a,remaining;b);(a;b,remaining))}

parse:{(k;v):": "\x; (k;" "\v)}
graph:!/+parse'input
{{graph[y],:,x}[x]'graph[x]}'!graph;
graph:?'graph

result.{1=result. x} growsets/,'-2?!graph
