class Solution {
  int maxProfit(List<int> prices) {
    if (prices.isEmpty) return 0;
    
    int minPrice = prices[0]; 
    int profit = 0;

    for (int price in prices) {
      if (price < minPrice) {
        minPrice = price;
      }
      else {
        profit = profit > price - minPrice ? profit : price - minPrice;
      }
    }
    return profit;
  }
}
