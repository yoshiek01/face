class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
  end

  protected
    def update_resource(resource, params)
      resource.update_without_current_password(params)
    end
end
