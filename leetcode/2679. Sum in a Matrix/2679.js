// stuff from my lib
Array.prototype.transpose = function() {
  let arr = [];
  for (let i = 0; i < this[0].length; i++) {
    arr[i] = [];
    for (let j = 0; j < this.length; j++) {
      arr[i][j] = this[j][i];
    }
  }
  return arr;
};
const _plus = (e, i) => e + i;
const _max = (e, i) => Math.max(e, i);
const _minus = (e, i) => e - i;

// solution
function matrixSum(nums) {
    return nums.map(e => e.sort(_minus))
               .transpose()
               .map(e => e.reduce(_max))
               .reduce(_plus);
};
