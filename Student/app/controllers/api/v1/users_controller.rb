class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token 

  def index
    @users = User.all
    render json: {user: JSONAPI::Serializer.serialize(@users,serializer: UserSerializer, is_collection: true), message: "Xyz", status: 200}
  end 

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(name: params[:name],email: params[:email])
    if @user.save
      @user.update(user_params)
      render json: @user
    else
      render json: {user: JSONAPI::Serializer.serialize(@user,serializer: UserSerializer, is_collection: true),status: 200}
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: { message: "User is Deleted.", :status => 406}
  end

  private
  def user_params
    params.permit(:name,:email)
  end
end
