class WinConditionsController < ApplicationController
  before_action :set_win_condition, only: [:show, :edit, :update, :destroy]

  # GET /win_conditions
  # GET /win_conditions.json
  def index
    @win_conditions = WinCondition.all
  end

  # GET /win_conditions/1
  # GET /win_conditions/1.json
  def show
  end

  # GET /win_conditions/new
  def new
    @win_condition = WinCondition.new
  end

  # GET /win_conditions/1/edit
  def edit
  end

  # POST /win_conditions
  # POST /win_conditions.json
  def create
    @win_condition = WinCondition.new(win_condition_params)

    respond_to do |format|
      if @win_condition.save
        format.html { redirect_to @win_condition, notice: 'Win condition was successfully created.' }
        format.json { render :show, status: :created, location: @win_condition }
      else
        format.html { render :new }
        format.json { render json: @win_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /win_conditions/1
  # PATCH/PUT /win_conditions/1.json
  def update
    respond_to do |format|
      if @win_condition.update(win_condition_params)
        format.html { redirect_to @win_condition, notice: 'Win condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @win_condition }
      else
        format.html { render :edit }
        format.json { render json: @win_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /win_conditions/1
  # DELETE /win_conditions/1.json
  def destroy
    @win_condition.destroy
    respond_to do |format|
      format.html { redirect_to win_conditions_url, notice: 'Win condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_win_condition
      @win_condition = WinCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def win_condition_params
      params.require(:win_condition).permit(:name, :game_id)
    end
end
