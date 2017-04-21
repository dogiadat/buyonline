class SearchController < ApplicationController
  def index
    @search = Restaurant.opening.search name_or_foods_name_cont:  params[:q]
    @restaurants = @search.result.distinct.page(params[:page])
      .per Settings.restaurants.page_size
  end
end
