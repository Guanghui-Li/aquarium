class HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]

  # GET /histories
  # GET /histories.json
  def index
    @histories = History.all
  end

  # GET /histories/1
  # GET /histories/1.json
  def show
  end

  # GET /histories/new
  def new
    @history = History.new
    @history.livestock_id = params[:id]
  end

  # GET /histories/1/edit
  def edit
  end

  # POST /histories
  # POST /histories.json
  def create
    error_messages = []
    bullet = '&#8226 '
    @history = History.new(history_params)
    puts "hello"
    puts history_params

    if @history.save
      respond_to do |format|
        format.html { redirect_to @history, notice: 'History was successfully created.' }
        format.json { render :show, status: :created, location: @history }
      end
    else
      redirect_to new_history_path(:id => @history.livestock_id)
      @history.errors.full_messages.each do |message|
        error_messages.push(bullet + message)
      end
      flash[:warning] = error_messages.join("<br/>")
    end
  end

  # PATCH/PUT /histories/1
  # PATCH/PUT /histories/1.json
  def update
    respond_to do |format|
      if @history.update(history_params)
        format.html { redirect_to @history, notice: 'History was successfully updated.' }
        format.json { render :show, status: :ok, location: @history }
      else
        format.html { render :edit }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /histories/1
  # DELETE /histories/1.json
  def destroy
    @history.destroy
    respond_to do |format|
      format.html { redirect_to histories_url, notice: 'History was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history
      @history = History.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_params
      params.require(:history).permit(:livestock_id, :event, :event_date, :image)
    end
end
