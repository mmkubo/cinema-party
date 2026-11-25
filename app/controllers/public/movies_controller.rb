class Public::MoviesController < Public::ApplicationController
  # 映画詳細はゲストでも閲覧可能
  allow_unauthenticated_access

  def show
    @movie = Movie.find(params[:id])
    @shout = Shout.new
    @shouts = @movie.shouts.order(created_at: :desc)
  end

  def search
    if params[:keyword].present?
      @movies = Movie.where("title LIKE ?", "%#{params[:keyword]}%")
    else
      @movies = Movie.none
    end
  end
end
