class GamePlayRolesController < ApplicationController
  before_action :set_game_play_role, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /game_play_roles
  # GET /game_play_roles.json
  def index
    @game_play_roles = GamePlayRole.all
  end

  # GET /game_play_roles/1
  # GET /game_play_roles/1.json
  def show
  end

  # GET /game_play_roles/new
  def new
    @game_play_role = GamePlayRole.new
  end

  # GET /game_play_roles/1/edit
  def edit
  end

  # POST /game_play_roles
  # POST /game_play_roles.json
  def create
    @game_play_role = GamePlayRole.new(game_play_role_params)

    respond_to do |format|
      if @game_play_role.save
        format.html { redirect_to @game_play_role, notice: 'Game play role was successfully created.' }
        format.json { render :show, status: :created, location: @game_play_role }
      else
        format.html { render :new }
        format.json { render json: @game_play_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_play_roles/1
  # PATCH/PUT /game_play_roles/1.json
  def update
    respond_to do |format|
      if @game_play_role.update(game_play_role_params)
        format.html { redirect_to @game_play_role, notice: 'Game play role was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_play_role }
      else
        format.html { render :edit }
        format.json { render json: @game_play_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_play_roles/1
  # DELETE /game_play_roles/1.json
  def destroy
    @game_play_role.destroy
    respond_to do |format|
      format.html { redirect_to game_play_roles_url, notice: 'Game play role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_play_role
      @game_play_role = GamePlayRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_play_role_params
      params.require(:game_play_role).permit(:game_play_id, :game_role_id, :user_id)
    end
end
