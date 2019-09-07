module Api
  class UsersController < ApplicationController
    before_action :query_user, only: [:show, :update, :destroy, :follower, :following]

    # GET /api/users
    def index
      @users = User.all
      render json: @users
    end

    # GET /api/users/:id
    def show
      (render json: { "error": "user not found" }, status: 404; return) if @user.nil?
      render json: @user
    end

    # POST /api/users
    def create
      (render json: { "error": "user exists" }, status: 500; return) unless User.find_by(user_id: params[:user_id]).nil?
      @user = User.new(user_param)
      if @user.save
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/users/:id
    def update
      (render json: { "error": "user not found" }, status: 404; return) if @user.nil?
      @user.user_name = params[:user_name]
      if @user.save
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/users/:id
    def destroy
      (render json: { "error": "user not found" }, status: 404; return) if @user.nil?
      @user.destroy
      render json: @user
    end

    # GET /api/users/follower/:id
    def follower
      (render json: { "error": "user not found" }, status: 404; return) if @user.nil?
      render json: @user.followers
    end

    # GET /api/users/following/:id
    def following
      (render json: { "error": "user not found" }, status: 404; return) if @user.nil?
      render json: @user.followings
    end

    # POST /api/users/sub?from&to
    def sub
      @from = User.find_by(user_id: params[:from])
      @to = User.find_by(user_id: params[:to])

      (render json: { "error": "subscriber user not found" }, status: 500; return) if @from.nil?
      (render json: { "error": "subscribee user not found" }, status: 500; return) if @to.nil?
      (render json: { "error": "couldn't subscribe oneself" }, status: 500; return) if @from == @to
      (render json: { "error": "already subscribe" }, status: 200; return) if @to.followers.include? @from

      @f = Follow.new(from_node: @from, to_node: @to)
      if @f.save
        render json: {
                 "from": @from,
                 "to": @to,
               }
      else
        render json: { "error": "follow failed" }, status: 500
      end
    end

    private

    def query_user
      @user = User.find_by(user_id: params[:id])
    end

    def user_param
      params.require(:user).permit(:user_id, :user_name)
    end
  end
end
