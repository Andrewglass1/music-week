class WelcomeController < ApplicationController
  def show
    redirect_to albums_path if current_user
  end
end
