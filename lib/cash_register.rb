require 'pry'

class CashRegister
  attr_accessor :total, :items, :discount, :price


  def initialize(discount=nil)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(item, price, quantity=1)
    @last_trans = (price*quantity)
    @total += price * quantity
    quantity.times do @items<< item
    end
  end

  def apply_discount
    if @discount == nil
      return "There is no discount to apply."
    else
      @total = (100 - @discount) * 0.01.to_f * @total
      return "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total =  @total - @last_trans
    @total
  end


end
