class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    if params.dig(:filter, :directors)
      selected_director_ids = params.dig(:filter, :directors).reject(&:empty?)
      @movies = @movies.joins(:director).where(directors: { id: selected_director_ids })
    end
  end
end
