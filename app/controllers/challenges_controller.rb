class ChallengesController < ApplicationController

  def index
    @challenges = Challenge.paginate(page: params[:page])
  end
end
