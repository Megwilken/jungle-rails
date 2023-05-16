class Admin::DashboardController < ApplicationController
  def show
  end

  def index
    @product_count = Product.count
    @category_count = Category.count
  end
end
