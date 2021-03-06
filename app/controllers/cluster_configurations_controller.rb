class ClusterConfigurationsController < ApplicationController
  before_action :set_cluster_configuration, only: [:show, :edit, :update, :destroy, :new_machine, :instantiate]

  # GET /cluster_configurations
  # GET /cluster_configurations.json
  def index
    @cluster_configurations = ClusterConfiguration.all
  end

  # GET /cluster_configurations/1
  # GET /cluster_configurations/1.json
  def show
    @templates = @cluster_configuration.cluster_templates
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
    @cluster_configuration.instantiated = 'false'
    if cluster_configuration_params['size'].to_i > 0
      cluster_configuration_params['size'].to_i.times do
        @cluster_configuration.cluster_templates += [ClusterTemplate.create]
      end
    end

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
    if @cluster_configuration.specifier != nil
      @cluster_configuration.delete_template
    end
    @cluster_configuration.destroy
    respond_to do |format|
      format.html { redirect_to cluster_configurations_url }
      format.json { head :no_content }
    end
  end

  # GET /cluster_configurations/1/new_machine
  def new_machine
    session[:cluster_id] = params[:id]
    redirect_to '/cluster_templates/new'
  end

  # GET /cluster_configurations/1/instantiate
  def instantiate
    if @cluster_configuration.bad_int_ips
      redirect_to :back , notice: 'Invalid ip set (duplicate or illegal)!'
      return
    end
    if @cluster_configuration.instantiated == 'true'
      redirect_to :back, notice: 'This configuration has already been instantiated!'
      return
    end
    @cluster_configuration.instantiate
    redirect_to :back , notice: 'Instantiated!'
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
