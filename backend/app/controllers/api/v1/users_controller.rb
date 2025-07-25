module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: User.all
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: user, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        user = User.find(params[:id])
        render json: user
      end

      def update
        user = User.find(params[:id])
        if user.update(user_params)
          render json: user
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        user = User.find(params[:id])
        user.destroy
        head :no_content
      end

      private

      def user_params
        params.require(:user).permit(:username, :nama, :email, :password)
      end
    end
  end
end
