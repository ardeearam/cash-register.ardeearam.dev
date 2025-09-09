class FrontPageController < ApplicationController

  def index
    @basket_id = session[:basket_id]
    if !@basket_id 
      basket = Basket.create!
      @basket_id = session[:basket_id] = basket.id
    end
  end
end
