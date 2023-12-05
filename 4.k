input:0:"4.input"

/ part 1
cast:{^x}_`I$'" "\
parse:{"|"\*1_":"\x}
winningNumbers:{
    w:cast@*parse x
    n:cast@*1_parse x
    +/~^'w?n}
points:(0,{2*x}\1)@
+/points'winningNumbers'input

/ part 2
result:#cache:winningNumbers'input
addCopies:{
    result+:n:cache[x]
    addCopies'1+x+!n}
addCopies'!result;
result

\\
