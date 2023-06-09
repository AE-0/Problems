// https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix/
const _plus = (e, i) => e + i;
const countNegatives = (grid) => grid.map(e => e.filter(e => e < 0).length).reduce(_plus);

// Tests
countNegatives([[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]]) // 18
countNegatives([[3,2],[1,0]]) // 0
