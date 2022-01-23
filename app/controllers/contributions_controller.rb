class ContributionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :new]
  before_action :correct_user, only: :destroy

  def new
    @contribution = Contribution.new
  end

  def create
    @contribution = current_user.contributions.build(contribution_params)
    @contribution.image.attach(params[:contribution][:image])
    if @contribution.save
      flash[:success] = "Beitrag angelegt!"
      redirect_to root_url
    else
      render 'static_pages/home'
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

  private

    def contribution_params
      params.require(:contribution).permit(:content, :image, :category_id, :title, :amount, :completion)
    end

    def correct_user
      @contribution = current_user.contributions.find_by(id: params[:id])
      redirect_to root_url if @contribution.nil?
    end
end
