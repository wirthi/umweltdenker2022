require 'set'

class ChallengesController < ApplicationController

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

  private
    def my_completed_challenges
      @completed_challenges = Set.new

      my_contributions = Contribution.where(user_id: current_user.id)
      my_contributions.each do |c|
        if c.challenge_id
          @completed_challenges.add(c.challenge)
        end
      end
    end
end
