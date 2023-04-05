# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0. You need to buy before you can sell. Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

def stock_picker(prices)
  best_buy_day = 0
  best_sell_day = 0
  best_profit = 0
  
  prices.each_with_index do |buy_price, buy_day|
    (buy_day + 1...prices.length).each do |sell_day|
    sell_price = prices[sell_day]
    profit = sell_price - buy_price
  
      if profit > best_profit
        best_profit = profit
        best_buy_day = buy_day
        best_sell_day = sell_day
      end
    end
      
    # Early return if no higher profit is possible
    return [best_buy_day, best_sell_day] if buy_day >= prices.length - 2 && best_profit == 0
  end
  
  result = [best_buy_day, best_sell_day]
  p result
  result
end

stock_picker([17,3,6,9,15,8,6,1,10])