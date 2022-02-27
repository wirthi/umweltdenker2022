class ContributionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :new, :edit, :update]
  before_action :correct_user, only: :destroy
  before_action :admin_user, only: [:edit, :update]

  def new
    @contribution = Contribution.new
    if params[:challenge]
      @template_challenge = Challenge.find_by(id: params[:challenge])
    end
  end

  def create
    @contribution = current_user.contributions.build(contribution_params)
    @contribution.image.attach(params[:contribution][:image])
    if @contribution.save
      flash[:success] = "Beitrag angelegt!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    @contribution.destroy
    flash[:success] = "Beitrag gelöscht!"
    if request.referrer.nil? || request.referrer == contributions_url
      redirect_to root_url
    else
      redirect_to request.referrer
    end
  end

  def index
    if params[:category]
      @contributions = Contribution.where(:category => params[:category]).paginate(page: params[:page])
      @category = Category.find_by(id: params[:category])
    else
      @contributions = Contribution.paginate(page: params[:page])
    end
  end

  def show
    @contribution = Contribution.find_by(id: params[:id])
  end

  def edit
    @contribution = Contribution.find(params[:id])
  end

  def update
    @contribution = Contribution.find(params[:id])
    if @contribution.update(contribution_params)
      flash[:success] = "Beitrag aktualisiert"
      redirect_to @contribution
    else
      render 'edit'
    end
  end

  private

    def contribution_params
      params.require(:contribution).permit(:content, :image, :category_id, :challenge_id, :title, :amount, :completion, :participants)
    end

    def correct_user
      @contribution = current_user.contributions.find_by(id: params[:id])
      redirect_to root_url if @contribution.nil?
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
