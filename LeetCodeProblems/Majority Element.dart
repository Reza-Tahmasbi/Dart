class Solution {
  int majorityElement(List<int> nums) {
        int candidate = 0;
        int count = 0;
        for (int num in nums){
            if (count == 0){
                candidate = num;
                count ++;
            }
            else if (candidate == num) {
                count ++;
            }else{
                count --;
            }
        }
        return candidate;
  }
}