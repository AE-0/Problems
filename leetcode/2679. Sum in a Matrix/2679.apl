⍝ https://leetcode.com/problems/sum-in-a-matrix/
MatrixSum ← {+/⌈/⍉⍵}
⍝ tests
MatrixSum 4 3 ⍴ 7 2 1 6 4 2 6 5 3 3 2 1 ⍝ 15
MatrixSum 1 ⍝ 1
