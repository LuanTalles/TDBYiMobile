class Api::V1::ReportsController < Api::V1::ApiController
  before_action :set_report, only: [:show, :update, :destroy]

  # GET /api/v1/reports
  def index
    # @reports = Report.all.joins(:user, :comment).pluck(:text,:name)
    @reports = Report.all

    # render json: @reports
  end

  # GET /api/v1/reports/1
  def show
    # render json: @report
  end

  # POST /api/v1/reports
  def create
    @report = Report.new(report_params)

    if @report.save
      render json: @report, status: :created
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/reports/1
  def update
    if @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/reports/1
  def destroy
    @report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def report_params
      params.require(:report).permit(:comment_id,:user_id)
    end
end
