import strutils, sequtils

let filename = "./input.txt".lines.toSeq.map(parseint)

# Part 1

var lastNum: int
var counter: int = -1

for i in filename:
    if lastNum < i:
        inc counter
    lastNum = i
echo counter

# Part 2

counter = -1
var lastSum: int
var sum: int

for index, i in filename[0 ..< ^2]:
    sum = filename[index] + filename[index + 1] + filename[index + 2]
    if sum > lastSum:
        inc counter
    lastSum = sum
echo counter