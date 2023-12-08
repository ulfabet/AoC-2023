input:0:"8.input"

"part 1"

instructions:*input
key:{3#x}
value:{(x@7 8 9; x@12 13 14)}
rules:(key'2_input)!value'2_input
follow:{ y {rules[x]@y}/("LR"!0 1)@x }

start:"AAA"
condition:{~x~"ZZZ"}

n:#1_condition(follow instructions)\start
n*#instructions

"part 2"

start:a@&{"A"=x@2}'a:!rules
condition:{~"Z"=x@2}

n:*/{ #1_condition(follow instructions)\x }'start
n*#instructions

\\
