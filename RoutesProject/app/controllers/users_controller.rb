class UsersController < ApplicationController
  def index
    render plain: "I am in the index action!"
  end

  def create
    user = User.new(params.require(:user).permit(:name, :email))
    # replace the `user_attributes_here` with the actual attribute keys
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    render json: user
  end

  def destroy
    User.destroy(params[:id])

    redirect_to controller: :users, action: :index
  end
  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
