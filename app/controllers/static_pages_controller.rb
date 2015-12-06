class StaticPagesController < ApplicationController
  def home
    @categories = Category.all if user_signed_in?
  end
end
