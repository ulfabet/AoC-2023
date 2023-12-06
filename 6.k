input:0:"6.input"

"part 1"
parse:{^x}_`I$" "\*1_":"\
time:parse@*input
distance:parse@*1_input
calc:{
    timeMoving:x-y
    timeMoving*speed:y }
answer:{*/{+/y<(calc x)'!x+1}.'+(time;distance)}
answer()

"part 2"
time:`I$,/$time
distance:`I$,/$distance
answer()

\\
