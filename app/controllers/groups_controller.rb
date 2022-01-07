class GroupsController < ApplicationController
  
  def index
    @groups = Group.paginate(page: params[:page])
  end
end
