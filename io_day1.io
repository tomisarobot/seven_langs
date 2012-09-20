#!/usr/bin/env io

"Adding:" println
"1 + 1 println" println
1 + 1 println

"(1 + 1 println) println" println
(1 + 1 println) println

"(1 + (1 println)) println" println
(1 + (1 println)) println

"(1 + 1) println" println
(1 + 1) println


"(1 + \"one\") println" println
"  error" println
# (1 + "one") println

"Objects:" println
Thing := Object clone
Thing desc := "THING THING"
Thing slotNames println

Thing desc ::= "THING THING"
Thing slotNames println

foo := Thing clone
foo clone

"Truth:" println
if ("") then ("empty: true" println) else ("empty: false" println)
if (nil) then ("nil: true" println) else ("nil: false" println)

