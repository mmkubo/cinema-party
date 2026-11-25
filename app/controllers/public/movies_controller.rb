class Public::MoviesController < Public::ApplicationController
  # 映画詳細はゲストでも閲覧可能
  allow_unauthenticated_access

  def show
    @movie = Movie.find(params[:id])
    @shout = Shout.new
    @shouts = @movie.shouts.order(created_at: :desc)
  end
end
