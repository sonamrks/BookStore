class ShopperController < ApplicationController
  include CurrentCart
  skip_before_action :authorize
  before_action :set_cart

  def index
    if params[:search]
      @products = Product.search(params[:search]).order("created_at ASC")
    else
    @products = Product.order(:name)
    end
  end
end
