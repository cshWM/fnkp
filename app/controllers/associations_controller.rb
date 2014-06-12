class AssociationsController < ApplicationController

  before_action :set_association, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,     only: [:new, :index, :show, :edit, :update, :destroy]
  before_action :admin_user,     only: [:new, :index, :show, :edit, :update, :destroy]


  # GET /associations
  # GET /associations.json
  def index
    @associations = Association.paginate(page: params[:page], :per_page => 5)
  end

  # GET /associations/1
  # GET /associations/1.json
  def show
  end

  # GET /associations/new
  def new
    @association = Association.new
  end

  # GET /associations/1/edit
  def edit
  end

  # POST /associations
  # POST /associations.json
  def create
    @association = Association.new(association_params)

    @user = User.new(name: @association.name,
                      email: @association.email,
                      password: @association.email,
                      password_confirmation: @association.email,
                      tipo: 2 )


    respond_to do |format|
      if @user.save
        @association.user_id = @user.id

        if @association.save
          format.html { redirect_to @association, notice: 'A associação foi criada com sucesso.' }
          format.json { render action: 'show', status: :created, location: @association }
        else
          @user.destroy
          format.html { render action: 'new' }
          format.json { render json: @association.errors, status: :unprocessable_entity }
        end
      else
#        logger.debug @user.errors.to_yaml
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /associations/1
  # PATCH/PUT /associations/1.json
  def update
    respond_to do |format|
      if @association.update(association_params)
        format.html { redirect_to @association, notice: 'A associação foi actualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @association.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /associations/1
  # DELETE /associations/1.json
  def destroy
    begin
      @user = User.find( @association.user_id )
      if @user.destroy
        @association.destroy
        flash[:success] = "Associação removida com sucesso."
        redirect_to associations_url
      end
    rescue ActiveRecord::RecordNotFound
      @association.destroy
      flash[:success] = "Associação removida com sucesso."
      redirect_to associations_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_association
      @association = Association.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def association_params
      params.require(:association).permit(:name, :short_name, :address, :postal4, :postal3, :city, :phone, :email, :president, :url, :user_id)
    end

    require 'uri'

    def valid?(url)
      uri = URI.parse(url)
      uri.kind_of?(URI::HTTP)
    rescue URI::InvalidURIError
      false
    end

end
