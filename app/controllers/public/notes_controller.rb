class Public::NotesController < Public::ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :authorize_note_owner, only: [:edit, :update, :destroy]

  def new
    @movie = Movie.find(params[:movie_id])
    @note = @movie.notes.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @note = @movie.notes.new(note_params)
    @note.user = Current.user

    if @note.save
      redirect_to note_path(@note)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @movie = @note.movie
  end

  def edit
  end

  def update
   if @note.update(note_params)
      redirect_to note_path(@note)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    movie = @note.movie
    @note.destroy

    redirect_to movie_path(movie)
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def authorize_note_owner
    unless @note.user == Current.user
      redirect_to note_path(@note), alert: "このNoteは編集できません。" 
    end
  end

  def note_params
    params.require(:note).permit(:title, :body)
  end
  
end
