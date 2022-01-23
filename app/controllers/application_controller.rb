class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :setup_data

  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location # for friendly forwarding
        flash[:danger] = "Bitte mit Benutzer-Account einloggen."
        redirect_to login_url
      end
    end

    def setup_data
      @categories = Category.all
      @challenges = Challenge.all
    end
end
