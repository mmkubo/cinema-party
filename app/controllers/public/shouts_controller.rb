class Public::ShoutsController < Public::ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    shout = Current.user.shouts.new(shout_params)
    shout.movie = movie

    if shout.save
      redirect_to movie_path(movie)
    else
      redirect_to movie_path(movie)
    end
  end

  def destroy
    shout = Current.user.shouts.find(params[:id])
    movie = shout.movie

    shout.destroy
    redirect_to movie_path(movie)
  end

  private

  def shout_params
    params.require(:shout).permit(:body)
  end
end