class SignupsController < ApplicationController
  def new
    @signup = Signup.new
  end

  def show
    @signup = Signup.find(params[:id])
  end

  def create
    @signup = Signup.new(params[:signup])
    if @signup.save
      redirect_to root_url, :notice => "signup added!"
    else
      render :new
    end
  end

  def index
    @signups =current_user.signups if current_user
  end
end