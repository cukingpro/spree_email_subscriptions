Spree::Product.class_eval do
  def self.dishes_on_date(date)
    available_ons = Dish::AvailableOn.where(delivery_date: date)
    product_ids = available_ons.pluck(:product_id)
    products = Spree::Product.where(id: product_ids)
  end
end
