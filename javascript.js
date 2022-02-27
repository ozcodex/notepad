// Javascript being Javascript

1 < 2 < 3 // true
3 > 2 > 1 // false

[] + [] // '' Empty string
[] + {} // [object Object]
{} + [] // 0
{} + {} // NaN

[] + 1 // "1"
{} + 1 // 1 
[] - 1 // -1

[] == [] // false
[] ==+ [] // true
[] - [] // 0

'11' + 1 // 111
'11' - 1 // 10

typeof null === 'object' //true

typeof NaN // Number
NaN instanceof Number //false
NaN == NaN // false

.1 + .2 //0.30000000000000004
.1 + .2 == .3 //false

9999999999999999 // 10000000000000000

"11" + 1 // '111'
"11" - 1 // 10

x = 0
x == x++ //true

Math.min() < Math.max() //false

(!+[]+[]+![]).length // 9
([![]] + [][[]]).length // 14
(![] + []).length // 5
[+!+[]]+[+[]] // '10'
[!+[]+!+[]+!+[]+!+[]]+[!+[]+!+[]] // 42

(x=1,++x,x++) == (x=1,x++,++x) //false
