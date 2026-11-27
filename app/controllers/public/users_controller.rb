class Public::UsersController < Public::ApplicationController
  before_action :set_user, only: [:show]

  def mypage
    @user = Current.user
    @notes = @user.notes.order(created_at: :desc)
  end

  def show
    @shouts = @user.shouts.order(created_at: :desc).limit(10)
  end

  def edit
    @user = Current.user
  end

  def update
    @user = Current.user

    if @user.update(user_params)
      redirect_to user_path(@user), notice: "プロフィールを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def withdraw
    Current.user.update(is_active: false)
    terminate_session
    redirect_to root_path, notice: "退会しました。"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email_address)
  end
end