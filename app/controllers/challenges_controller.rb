require 'set'

class ChallengesController < ApplicationController
  before_action :admin_user,     only: [:edit, :update]

  def index
    @challenges = Challenge.paginate(page: params[:page])

    if logged_in?
      my_completed_challenges
    end
  end

  def show
    @challenge = Challenge.find(params[:id])

    if logged_in?
      my_completed_challenges
    end
  end

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def update
    @challenge = Challenge.find(params[:id])
    if @challenge.update(challenge_params)
      flash[:success] = "Challenge aktualisiert"
      redirect_to @challenge
    else
      render 'edit'
    end
  end

  private
    def challenge_params
      params.require(:challenge).permit(:title, :description, :submission, :category_id)
    end

    def my_completed_challenges
      @completed_challenges = Set.new

      my_contributions = Contribution.where(user_id: current_user.id)
      my_contributions.each do |c|
        if c.challenge_id
          @completed_challenges.add(c.challenge)
        end
      end
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
