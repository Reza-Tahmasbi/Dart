class Solution {
  int removeDuplicates(List<int> nums) {
    Set<int> uniqueNums = nums.toSet();
    nums.clear();
    nums.addAll(uniqueNums);
    return nums.length;
  }
}