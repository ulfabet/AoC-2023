input:0:"13.input"

"part 1"

split:0,&(""~)'input
patterns:{x@&~{""~x}'x}'split_input

compare:{ &//x=y }

try:{
    b:(0,y)_!#x
    c:&/#'b
    mirror:|x (-c)#b@0
    image:x c#b@1
    mirror[0]:image[0]
    y*compare[mirror;image] }

potentials:{ &&/'=':x }

lor:{
    a:potentials x
    $[ #a; +/(try x)'a; 0 ] }

summarize:{ (100*lor@x) + lor@+x }
+/summarize'patterns

"part 2"

// smudge in reflection line

compare:{ &//x=y }
potentials:{ &1=+/'~=':x }
part:+/summarize'patterns

// smudge elsewhere

compare:{ 1=+//~x=y }
potentials:{ &&/'=':x }
+/part,summarize'patterns

\\
