class Public::MoviesController < Public::ApplicationController
  # 映画詳細はゲストでも閲覧可能
  allow_unauthenticated_access

  def show
    @movie = Movie.find(params[:id])
  end
end
