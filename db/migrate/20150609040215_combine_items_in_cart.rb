class CombineItemsInCart < ActiveRecord::Migration
  def up
    #for each item in cart                                                                                                                           
    Cart.all.each do |cart|
      # number of each product in cart      
      # result sums will be a list of ordered pairs of 
      # product_ids and quantity                                                                                                          
      sums = cart.line_items.group(:product_id).sum(:quantity)
      # for each group                                                                                                                               
      sums.each do | product_id, quantity|
        if quantity > 1
          # remove all items                                                                                                                         
          cart.line_items.where(product_id: product_id).delete_all
          # replace with single item                                                                                                                 
          item = cart.line_items.build(product_id: product_id)
          # set quantity                                                                                                                             
          item.quantity = quantity
          item.save!
        end
      end
    end
  end
end
