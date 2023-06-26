// https://leetcode.com/problems/maximum-difference-between-increasing-elements/
// stuff from my lib
Array.prototype.zipWith = function(lambda, arr) {
  const result = [];
  for (let i = 0; i < this.length; i++) {
    result.push(lambda(this[i], arr[i]));
  }
  return result;
};
Array.prototype.scan = function(lambda) {
  return this.map((_, i, a) => a.slice(0, i + 1).reduce(lambda));
};
Function.prototype.flip = function(...args) {
  const fn = this;
  return function(...args) { return fn.apply(this, args.reverse()) };
};
const _max = (e, i) => Math.max(e, i);
const _min = (e, i) => Math.min(e, i);
const _minus = (e, i) => e - i;

// solution
function maximumDifference(nums) {
    return nums.scan(_min)
               .zipWith(_minus.flip(), nums)
               .filter(e => e != 0)
               .reduce(_max, -1);
}
maximumDifference([7, 1, 5, 4]); // 4
maximumDifference([9, 4, 3, 2]); // -1
maximumDifference([1, 5, 2, 10]); // 9
