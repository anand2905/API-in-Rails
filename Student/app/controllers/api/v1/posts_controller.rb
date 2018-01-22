class Api::V1::PostsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
	  @user = User.find(params[:user_id])
	  @posts =@user.posts.all
	  render json: {post: JSONAPI::Serializer.serialize(@posts,serializer: PostSerializer, is_collection: true),status: 200}
	end

	def show
		@user = User.find(params[:id])
		@post =@user.posts.all
		render json: {post: JSONAPI::Serializer.serialize(@posts,serializer: PostSerializer, is_collection: true),status: 200}
	end

	def create
		@user = User.find(params[:user_id])
		@post = @user.post.new(name: params[:title],email: params[:content])
		if @user.save
			@user.update(user_params)
			render json: @user
		else
			render json: { message: "User cannot be saved.", :status => 406}
			render json: @post
		end
	end

	private

	def post_params
		params.permit(:title, :content)
	end
end


