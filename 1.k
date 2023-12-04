input:0:"1.input"

/ part 1
calibrationValue:{a:{^x}_`I$'x;(10**a)+*|a}
+/calibrationValue'input

/ part 2
k:$`one`two`three`four`five`six`seven`eight`nine
search:{f:{&/k[y]=(#k[y])#x} x; *&f'!9}
translate:{$[0<#x; $[^n:search x; 1#x; $1+n],translate 1_x; ""]}
+/calibrationValue'translate'input

\\
