input:0:"20.input"

state:inputs:outputs:module:()!()

flipFlop:{
    (source; pulse; target):x
    $[ 0=pulse; state[target]:~state[target]; ]
    $[ 0=pulse; (target; state[target]){x,,y}/:outputs[target]; () ] }

conjunction:{
    (source; pulse; target):x
    d:state[target]; d[source]:pulse; state[target]:d
    pulse:~0|&/state[target] inputs[target]
    (target; pulse){x,,y}/:outputs[target] }

broadcaster:{
    (source; pulse; target):x
    (target; pulse){x,,y}/:outputs[target] }

parseLine:{
    a:"-"\x^" >"
    name:(a 0)^"%&"
    outputs[name]:","\a 1
    $[ "%"=*a 0; (module[name]:flipFlop; state[name]:0); ]
    $[ "&"=*a 0; (module[name]:conjunction; state[name]:()!()); ]
    $[ "b"=*a 0; module[name]:broadcaster; ]
    ({ inputs[y],:,x } name)'outputs[name]
    }

pulses:,("button"; 0; "broadcaster")

"part 1"

parseLine'input;

send:{ $[ ^m:module[x 2]; (); m x ] }
button:{ ,/{x 1}''{ ,/send'x }\pulses }
calc:{ +/'(x;~x) }
*/+/calc'1_1000 button\0

"part 2"

parseLine'input;

count:0
counts:()!()
monitor:*inputs["rx"]

send2:{
    (source; pulse; target):x
    $[ (monitor~target)&(1=pulse); counts[source],:count; ]
    $[ ^m:module[target]; (); m x ] }
button2:{ count+:1; { ,/send2'x }/pulses }
10000 button2\0;
// should probably use lcm
*/&/'counts
