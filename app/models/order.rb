class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  PAYMENT_TYPES = ["Check", "Credit Card", "Money Order"]
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  def add_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      oid = self.id
      item.order_id = oid
    end
  end
end
