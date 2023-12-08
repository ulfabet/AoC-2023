input:0:"5.input"
input,:,""

"part 1"

offset:0
consume:{ r:x#offset_input; offset+:x; r }

readSeeds:{ {^x}_`I$" "\*1_":"\ln:*consume 2 }
readList:{ $[""~ln:*consume 1; (); (,`I$" "\ln),readList()] }
readMap:{
    consume 1
    d:(,0)!0
    d { next:(y@1)+y@2; x[next]:((convert x)@next)-next; x[y@1]:(y@0)-y@1; x }/readList() }

convert:{
    k:!x
    k:k[<k]
    pos:*&(y<k),1
    y+x[k[pos-1]] }

seeds:readSeeds()
maps:1_7 readMap\0
&/seeds {(convert y)'x}/maps

"part 2"

convertRange:{
    k:!x
    k:k[<k]
    src:y@0
    len:y@1
    pos:*&(src<k),1
    end:*&((src+len-1)<k),1
    result:(src+x[k[pos-1]]),len
    $[pos=end; result; (result[0],k[pos]-src), (convertRange x) (k[pos],len-(k[pos]-src))] }

pairs:0N 2#seeds
&/*'pairs {0N 2#,/(convertRange y)'x}/maps

\\
