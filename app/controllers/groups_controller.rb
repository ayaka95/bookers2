class GroupsController < ApplicationController

  def new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = owner_id
    if @group.save
      redirect_to groups_path
    end
  end

  def index
    @group = Group.all
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :owner_id)
  end

end
