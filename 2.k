input:0:"2.input"

/ part 1
rgb:($`red`green`blue)!12 13 14
parseLine:{";"\*1_":"\x}
parseGame:{`I$*-1#" "\*":"\x}
parseSet:{","\x}
possibleSet:{a:1_" "\x;n:`I$*a;c:*|a;~n > rgb[c]}
p:{&/,/possibleSet''parseSet'parseLine x}'input
+/parseGame'input@&p

/ part 2
completeSet:{{d:($`red`green`blue)!3#0;s:" "\x;d[s@2]:`I$s@1;.d} x}
+/*/'{|/|/'completeSet''parseSet'parseLine x}'input

\\
