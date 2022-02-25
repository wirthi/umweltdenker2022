class ChallengesController < ApplicationController

  def index
    @challenges = Challenge.paginate(page: params[:page])
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
