class UserController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user} !"
      sign_in @user
      redirect_to @user
    else
      flash.now[:danger] = "invalid inputs"
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @events = @user.events.paginate(page: params[:page])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end