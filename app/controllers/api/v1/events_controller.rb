class Api::V1::EventsController < Api::V1::ApiController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /api/v1/events
  def index
    @events = Event.all

    render json: @events
  end

  # GET /api/v1/events/1
  def show
    render json: @event
  end

  # POST /api/v1/events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:name, :description, :lat, :lng)
    end
end
