class Api::V2::GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  #TODO : remove line bellow, it skips auth
  skip_before_action :verify_authenticity_token

  # GET /groups
  # GET /groups.json
  def index
    @groups = MasterData::Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = MasterData::Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = MasterData::Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'MasterData::Group was successfully created.' }
        format.json { render :show, status: :created, location:  :api_v2_groups}
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'MasterData::Group was successfully updated.' }
        format.json { render :show, status: :ok, location: :api_v2_groups }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to api_v2_groups_url, notice: 'MasterData::Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = MasterData::Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:guid, :name, :description)
    end
end