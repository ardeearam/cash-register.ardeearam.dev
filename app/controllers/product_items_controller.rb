class ProductItemsController < ApplicationController

  before_action :set_basket

  def create
    product = Product.find_by_code!(product_code_params[:product_code])
    @basket.add(product)
  end

  private

  def product_code_params
    params.require(:product_item).permit(:product_code)
  end

  def set_basket
    @basket = Basket.find(params[:basket_id])
  end



end
