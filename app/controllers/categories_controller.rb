class CategoriesController < ApplicationController
  def search
    @categories = Category.all
    @events = []
  end

  def find_events
    @categories = Category.all  # Re-assign @categories
    @events = Event.joins(:categories).where(categories: { id: params[:category_id] })
    render :search
  end
end