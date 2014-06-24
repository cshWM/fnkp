class CoachCategoriesController < ApplicationController
  before_action :set_coach_category, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,     only: [:new, :index, :show, :edit, :update, :destroy]
  before_action :admin_user,     only: [:new, :index, :show, :edit, :update, :destroy]

  # GET /coach_categories
  # GET /coach_categories.json
  def index
    @coach_categories = CoachCategory.paginate(page: params[:page], :per_page => 15)
  end

  # GET /coach_categories/1
  # GET /coach_categories/1.json
  def show
  end

  # GET /coach_categories/new
  def new
    @coach_category = CoachCategory.new
  end

  # GET /coach_categories/1/edit
  def edit
  end

  # POST /coach_categories
  # POST /coach_categories.json
  def create
    @coach_category = CoachCategory.new(coach_category_params)

    respond_to do |format|
      if @coach_category.save
        format.html { redirect_to @coach_category, notice: 'Categoria de treinador foi criada com sucesso.' }
        format.json { render action: 'show', status: :created, location: @coach_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @coach_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coach_categories/1
  # PATCH/PUT /coach_categories/1.json
  def update
    respond_to do |format|
      if @coach_category.update(coach_category_params)
        format.html { redirect_to @coach_category, notice: 'Categoria de treinador foi actualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @coach_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coach_categories/1
  # DELETE /coach_categories/1.json
  def destroy
    @coach_category.destroy
    respond_to do |format|
      format.html { redirect_to coach_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coach_category
      @coach_category = CoachCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coach_category_params
      params.require(:coach_category).permit(:name, :order, :active)
    end
end
