input:0:"24.input"
testArea:2#,2e14 4e14

parse:{ `I$","\'"@"\x^" " }

triangle:{ x*{x<\:x}@!#x }

inside:{[window;point] ~|//window {[w;p] (p<w 0;p>w 1)}'point }

intersection:{[stone1;stone2]
    (p1;v1):2#'stone1
    (p2;v2):2#'stone2
    c:+/(-a:%/|v1;1)*p1
    d:+/(-b:%/|v2;1)*p2
    p:((d-c)%(a-b);c+a*(d-c)%(a-b))
    // compare velocity with intersection vectors
    $[ &/(~/0<(v1;p-p1);~/0<(v2;p-p2)); p; 0n 0n ] }

"part 1"

stones:parse'input
+//inside[testArea]''triangle stones intersection/:\:stones
