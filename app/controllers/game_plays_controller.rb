class GamePlaysController < ApplicationController
  before_action :set_game_play, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /game_plays
  # GET /game_plays.json
  def index
    @game_plays = GamePlay.all
  end

  # GET /game_plays/1
  # GET /game_plays/1.json
  def show
  end

  # GET /game_plays/new
  def new
    @game_play = GamePlay.new
  end

  # GET /game_plays/1/edit
  def edit
  end

  # POST /game_plays
  # POST /game_plays.json
  def create
    @game_play = GamePlay.new(game_play_params)
    @game_play.user = current_user
    respond_to do |format|
      if @game_play.save
        format.html { redirect_to @game_play, notice: 'Game play was successfully created.' }
        format.json { render :show, status: :created, location: @game_play }
      else
        format.html { render :new }
        format.json { render json: @game_play.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_plays/1
  # PATCH/PUT /game_plays/1.json
  def update
    respond_to do |format|
      if @game_play.update(game_play_params)
        format.html { redirect_to @game_play, notice: 'Game play was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_play }
      else
        format.html { render :edit }
        format.json { render json: @game_play.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_plays/1
  # DELETE /game_plays/1.json
  def destroy
    @game_play.destroy
    respond_to do |format|
      format.html { redirect_to game_plays_url, notice: 'Game play was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_play
      @game_play = GamePlay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_play_params
      params.require(:game_play).permit(:game_id, :day, :name, :user_id, :win_condition_id, game_play_roles_attributes: [:id, :game_role_id, :user_id, :name, :won, :_destroy])
    end
end
