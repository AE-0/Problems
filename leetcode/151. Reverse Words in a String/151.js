// https://leetcode.com/problems/reverse-words-in-a-string/
const reverseWords = (s) => s.split(" ").filter(e => e != "").reverse().join(" ");

// Tests
reverseWords("the sky is blue")   // "blue is sky the"
reverseWords("  hello world  ")   // "world hello"
reverseWords("a good   example")  // "example good a"
