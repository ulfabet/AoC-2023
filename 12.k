input:0:"12.input"

split:{
    marks:,/{^x}_(=x)"?#"
    (&{~x=y+1}':sorted)_sorted:marks[<marks] }

arrangements:{ $[ y; _0.5+(*/{(x+y)%(1+y)}[x]'!y); 1 ] } // polyhedral

lookforknownsprings:{[row;part;fit]

    subroutine:{[row;part;fit;free]
        // match longest possible continuous group of #
        r:(row. ,part)
        i:r?"#"
        j:&/{^x}_(i_r,".")?".?"
        n:+/~i<free{x+y+1}\fit
        a:(free#"."){(x,y#"#"),"."}/((#fit)&n+1)#fit
        match:(j#"#")~a i+!j
        match&:~"#"=r[(#a)-1]
        $[ match;; :0 ]
        factor:$[ n; arrangements[n+1; free]; 1 ]
        nextfit:(n+1)_fit
        a:(0=#nextfit)_a
        nextpart:(#a)_part
        factor*lookforknownsprings[row;nextpart;nextfit] }

    $[ #fit;; :^(row. ,part)?"#" ]
    free:(#part)-(+/fit)+(#fit)-1
    $[ ^(row. ,part)?"#"; arrangements[(#fit)+1; free]; +/subroutine[row;part;fit]'!free+1 ] }

generate:{[row;parts;groups]

    search:{[row;parts;groups;result]
        $[ (0=#parts)&(#groups); :(); ]
        $[ #parts;; :result ]
        part:*parts
        // how many will fit?
        n:+/~(#part)<-1{x+y+1}\groups
        // if part contains # => n cannot be 0
        nmin:~^(row. ,part)?"#"
        // quit early if groups would not fit rest of parts
        $[ (+/#'parts)<(+/groups); :(); ]
        ,/{[oo;groups;result;x] oo[x_groups;result,,x#groups]}[o[row;1_parts];groups;result]'nmin_!1+n }

    (0N;#parts)#search[row;parts;groups;()] }

"part 1"

part1:{
    (row; groups):" "\x
    groups:`I$","\groups
    parts:split row
    distributions:generate[row;parts;groups]
    +/*/'{x lookforknownsprings[y]'z}[parts;row]'distributions }

+/part1'input

"part 2"

part2:{
    (row; groups):" "\x
    row:"?"/5#,row
    groups:,/5#,`I$","\groups
    parts:split row
    distributions:generate[row;parts;groups]
    +/*/'{x lookforknownsprings[y]'z}[parts;row]'distributions }

+/part2'input
