class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  #http_basic_authenticate_with name: 'lian',
  #  password: 'lian', except: [:index, :show]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @societies = Society.all#add this
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @society = Society.find(params[:society_id])#add this, if uses path like this: society_event GET    /societies/:society_id/events/:id(.:format) events#show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  def new
    @society = Society.find(params[:society_id])#add this
    @event = Event.new
    3.times {@event.event_images.build} #added this
  end

  # GET /events/1/edit
  def edit
    @society = Society.find(params[:society_id])#add this
    @event = Event.find(params[:id])
    3.times { @event.event_images.build } # … and this
  end

  # POST /events
  # POST /events.json
  def create
    @society = Society.find(params[:society_id])
    @event = @society.events.create(event_params)
    #@event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to society_path(@society), notice: 'Event was successfully created.' }
        #format.html { redirect_to event_path, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @society = Society.find(params[:society_id]) #added this
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to society_event_path, notice: 'Event was successfully updated.' } #path changed
        format.json { head :no_content }
      else
        3.times { @event.event_images.build }#add this
        format.html { render action: 'edit' } #render dose not run the action 'edit'
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @society = Society.find(params[:society_id])
    @event = @society.events.find(params[:id])
    @event.destroy
    respond_to do |format|
      format.html { redirect_to society_path(@society) }
      #format.html { redirect_to events_path }
      format.json { head :no_content }
    end
  end

  def ticket
    @tickets = Event.ticket params[:ticket]

  end
  def search
    @events = Event.search params[:search]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :event_type, :content, 
        :date, :time, :venue, :ticket_price, :ticket_number,
        :event_images_attributes=>[:photo, :id, :_destroy] )
    end
end
