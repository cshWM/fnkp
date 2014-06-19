class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,     only: [:new, :index, :show, :edit, :update, :destroy]


  # GET /orders
  # GET /orders.json
  def index
    # as associacoes só podem ver os ordens que dizem respeito a ordens duas e estejam validos
    # os clubes só podem ver os ordens que dizem respeito a si e estejam validos
    # a fnkp deve poder ver tudo (mas aparecer visualmente a cinza )
    if is_admin?
      @orders = Order.paginate(page: params[:page], :per_page => 5)
    else
      @orders = Order.where("user_id = ?", current_user).paginate(page: params[:page], :per_page => 5)
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    # as associacoes só podem ver os ordens que dizem respeito a ordens suas e estejam validos
    # os clubes só podem ver os ordens que dizem respeito a si e estejam validos
    # a fnkp deve poder ver tudo (mas aparecer visualmente a cinza )
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @order = current_user.orders.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.state = 'Criada'
    @order.state_date = DateTime.now
    @order.total_value = 0
    @order.user_id = current_user.id # csh alterar para permitir que o admin crie notas para as associações

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "Ordem de pagamento criada com sucesso." }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @estado = @order.state
    # CSH nao pode permitir actualização à data do estado, pois esta deve ser sempre actualizada aquando da mudança de estado
    respond_to do |format|
      @order.state_date = Datetime.now if @estado != @order.state
      if @order.update(order_update_params)
        format.html { redirect_to @order, notice: 'Ordem de pagamento actualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    # CSH nunca pode apagar, apenas pode mudar o estado para anulado
    # os items têm de ser libertados
    LineItem.where("order_id = ?", @order.id).destroy_all
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :total_value, :state, :state_date)
    end

    def order_update_params
      params.require(:order).permit(:name, :state)
    end

end
