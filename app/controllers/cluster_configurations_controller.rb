class ClusterConfigurationsController < ApplicationController
  before_action :set_cluster_configuration, only: [:show, :edit, :update, :destroy]

  # GET /cluster_configurations
  # GET /cluster_configurations.json
  def index
    @cluster_configurations = ClusterConfiguration.all
  end

  # GET /cluster_configurations/1
  # GET /cluster_configurations/1.json
  def show
  end

  # GET /cluster_configurations/new
  def new
    @cluster_configuration = ClusterConfiguration.new
  end

  # GET /cluster_configurations/1/edit
  def edit
  end

  # POST /cluster_configurations
  # POST /cluster_configurations.json
  def create
    @cluster_configuration = ClusterConfiguration.new(cluster_configuration_params)

    respond_to do |format|
      if @cluster_configuration.save
        format.html { redirect_to @cluster_configuration, notice: 'Cluster configuration was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cluster_configuration }
      else
        format.html { render action: 'new' }
        format.json { render json: @cluster_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cluster_configurations/1
  # PATCH/PUT /cluster_configurations/1.json
  def update
    respond_to do |format|
      if @cluster_configuration.update(cluster_configuration_params)
        format.html { redirect_to @cluster_configuration, notice: 'Cluster configuration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cluster_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cluster_configurations/1
  # DELETE /cluster_configurations/1.json
  def destroy
    @cluster_configuration.destroy
    respond_to do |format|
      format.html { redirect_to cluster_configurations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cluster_configuration
      @cluster_configuration = ClusterConfiguration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cluster_configuration_params
      params.require(:cluster_configuration).permit(:specifier, :size)
    end
end
