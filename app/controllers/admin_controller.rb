class AdminController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @total_orders = Order.count
  end
end
