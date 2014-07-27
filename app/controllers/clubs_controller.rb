class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,     only: [:new, :index, :show, :edit, :update, :destroy]
  before_action :association_user, only: [:new]
  before_action :admin_user,     only: [:destroy]

  # GET /clubs
  # GET /clubs.json
  def index
    if is_admin?
      @clubs = Club.paginate(page: params[:page], :per_page => 15)
    elsif is_association?
      @clubs = Club.where( association_id: my_association ).paginate(page: params[:page], :per_page => 15)
    elsif is_club?
      @clubs = Club.where( club_id: current_user.id ).paginate(page: params[:page], :per_page => 15)
    end
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
    unless is_admin?
      if is_association?
        @club = Club.where( "id = :cid and association_id = :aid",
            { cid: params[ :id ], aid: my_association } ).first
      elsif is_club?
        @club = Club.find_by( club_id: current_user.id ) #CSH
      end
    end

    @athlete = Athlete.new(club_id: params[:id])
    @atletas = Athlete.where(club_id: params[:id])

    @atletas = @atletas.order(active: :desc, short_name: :asc) if params[:orderby] == 'nameasc'
    @atletas = @atletas.order(active: :desc, short_name: :desc) if params[:orderby] == 'namedesc'

    @atletas = @atletas.order(active: :desc, fnkp_code: :asc) if params[:orderby] == 'fnkpasc'
    @atletas = @atletas.order(active: :desc, fnkp_code: :desc) if params[:orderby] == 'fnkpdesc'

    @atletas = @atletas.order(active: :desc, sex: :asc) if params[:orderby] == 'sexasc'
    @atletas = @atletas.order(active: :desc, sex: :desc) if params[:orderby] == 'sexdesc'

    @atletas = @atletas.order(active: :desc, birthdate: :asc) if params[:orderby] == 'dtasc'
    @atletas = @atletas.order(active: :desc, birthdate: :desc) if params[:orderby] == 'dtdesc'

    @atletas = @atletas.order(active: :desc, fnkp_code: :desc) unless params[:orderby]




    @club_fees = ClubFeeIssue.where( club_id: params[:id])

    @club_fees = @club_fees.order(name: :asc) if params[:orderby] == 'qnameasc'
    @club_fees = @club_fees.order(name: :desc) if params[:orderby] == 'qnamedesc'

    @club_fee_current = ClubFee.find_by( valid_year: Date.today.year, active: true )
    @club_is_current = @club_fees.find_by_club_fee_id_and_club_id( @club_fee_current, params[:id] )

  end

  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs
  # POST /clubs.json
  def create
    @club = Club.new(club_params)
    # valores default
    @club.active = true
    @club.association_id = Association.find_by( :user_id => current_user.id ).id

    if @club.email.present? and @club.email.length > 5
      @user = User.new(name: @club.name,
                        email: @club.email,
                        password: @club.email,
                        password_confirmation: @club.email,
                        tipo: 3 )
    end

    respond_to do |format|
      if @club.email.present? and @club.email.length > 5
        if @user.save
          @club.user_id = @user.id
          # os admins nao podem criar clubes, apenas as proprias associações
          # NOTA CSH: numa versao onde os admins possam criar clubes para poder transitar de uma associação para outra p.ex. tem de ser alterado

          if @club.save
            format.html { redirect_to @club, notice: 'O clube foi criado com sucesso.' }
            format.json { render action: 'show', status: :created, location: @club }
          else
            @user.destroy
            format.html { render action: 'new' }
            format.json { render json: @club.errors, status: :unprocessable_entity }
          end
        else
  #        logger.debug @user.errors.to_yaml
            format.html { render action: 'new' }
            format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        if @club.save
          format.html { redirect_to @club, notice: 'O clube foi criado com sucesso.' }
          format.json { render action: 'show', status: :created, location: @club }
        else
          format.html { render action: 'new' }
          format.json { render json: @club.errors, status: :unprocessable_entity }
        end
      end

    end
  end

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update
    # só criar o user no caso de ainda não existir
    if @club.user_id.nil? and @club.email.present? and @club.email.length > 5
      @user = User.new(name: @club.name,
                        email: @club.email,
                        password: @club.email,
                        password_confirmation: @club.email,
                        tipo: 3 )
    end

    respond_to do |format|
      if @club.user_id.nil? and @club.email.present? and @club.email.length > 5
        if @user.save
          @club.user_id = @user.id
          if @club.update(club_params)
            format.html { redirect_to @club, notice: 'Clube actualizado com sucesso.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: @club.errors, status: :unprocessable_entity }
          end
        else
          @user.destroy
          format.html { render action: 'edit' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
          if @club.update(club_params)
            format.html { redirect_to @club, notice: 'Clube actualizado com sucesso.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: @club.errors, status: :unprocessable_entity }
          end
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    @club.destroy
    respond_to do |format|
      flash[:notice] = 'Clube foi apagado com sucesso.'
      format.html { redirect_to clubs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:name, :short_name, :address, :postal4, :postal3, :city, :phone, :email, :president, :url, :municipality_id)
    end

end
