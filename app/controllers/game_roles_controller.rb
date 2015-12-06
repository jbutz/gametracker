class GameRolesController < ApplicationController
  before_action :set_game_role, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /game_roles
  # GET /game_roles.json
  def index
    @game_roles = params[:game_id].present? ? Game.find(params[:game_id]).game_roles.all : GameRole.all
  end

  # GET /game_roles/1
  # GET /game_roles/1.json
  def show
  end

  # GET /game_roles/new
  def new
    @game_role = GameRole.new
  end

  # GET /game_roles/1/edit
  def edit
  end

  # POST /game_roles
  # POST /game_roles.json
  def create
    @game_role = GameRole.new(game_role_params)

    respond_to do |format|
      if @game_role.save
        format.html { redirect_to @game_role, notice: 'Game role was successfully created.' }
        format.json { render :show, status: :created, location: @game_role }
      else
        format.html { render :new }
        format.json { render json: @game_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_roles/1
  # PATCH/PUT /game_roles/1.json
  def update
    respond_to do |format|
      if @game_role.update(game_role_params)
        format.html { redirect_to @game_role, notice: 'Game role was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_role }
      else
        format.html { render :edit }
        format.json { render json: @game_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_roles/1
  # DELETE /game_roles/1.json
  def destroy
    @game_role.destroy
    respond_to do |format|
      format.html { redirect_to game_roles_url, notice: 'Game role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_role
      @game_role = GameRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_role_params
      params.require(:game_role).permit(:name, :game_id)
    end
end
