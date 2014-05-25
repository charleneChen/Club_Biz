class GroupsController < ApplicationController
  def index
    @groups = Group.all #societies/society_id/groups show all groups
    @society = Society.find(params[:society_id])
    @events = @society.events
  end

  def new
    @group = Group.new
    #@societies = Society.all #/societies/1/events/1/group/new show all groups
  end

  def edit
    @group = Group.find(params[:id])
  end

  def show
    #@society = Society.find(params[:society_id])
    @group = Group.find(params[:id])
  end

  def create
    #@society = Society.find(params[:society_id])
    @event = Event.find(params[:event_id])
    @group = Group.new(group_params)

    respond_to do |format|
      if @event.group
        flash[:notice] = "this event has been shared with other societies."
        format.html { render action: 'new' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      else
        @group.save
        @event.group = @group #an event has one group
        format.html { redirect_to  society_groups_path, notice: 'Group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      end
    end
  end

  def update
    @group = Group.find(params[:id])
    #params[:society_ids] ||= []
    respond_to do |format|
      if @group.update(group_params)
        flash[:notice] = 'Invite was sent to those societies.'
        format.html {redirect_to group_path(@group)}
      else
        redirect_to group_path
        format.html {render action: 'show'}
      end
    end
  end

  def destroy
    #@society = Society.find(params[:society_id])
    @group = Group.find(params[:id])
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_path }
      #format.html { redirect_to events_path }
      format.json { head :no_content }
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def group_params
    params.require(:group).permit(:name, :society_ids=>[])
  end
end
