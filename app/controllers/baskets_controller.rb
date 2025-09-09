class BasketsController < ApplicationController

  before_action :set_basket, only:  [:destroy, :show]

  def create
  end

  def show
  end

  #For now, let's use "destroy"
  #to remove all items of a basket, and not to actually delete it from the
  #database
  def destroy
    @basket.product_items.destroy_all
  end

  private

  def set_basket
    @basket = Basket.find(params[:id])
  end

end
