class UsersController < ApplicationController
  ActionController::API.send :include, ActionController::StrongParameters

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    puts "called create"
    p params

    User.create(user_params)

    render nothing: true
  end

  def update
    puts "called update"
    p params

    User.find(params[:id]).update(user_params)

    render nothing: true
  end

  def destroy

  end



  def user_params
    params.require(:user).permit(:first_name, :last_name, :city)
  end

  def default_serializer_options
    { root: false }
  end

end
