module Api
  class UsersController < ApplicationController
    before_action :query_user, only: [:show, :update, :destroy]

    # GET /api/users
    def index
      @users = User.all
      render json: @users
    end

    # GET /api/users/1
    def show
      render json: @user
    end

    # POST /api/users
    def create
      @user = User.new(user_param)
      if @user.save
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/users/1
    def update
      @user.user_name = params[:user_name]
      if @user.save
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/users/1
    def destroy
      @user.destroy
      render json: @user
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
