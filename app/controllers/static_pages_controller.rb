class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @contribution = current_user.contributions.build
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
