class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :create_order]
  helper_method :sort_column, :sort_direction


  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.order(sort_column + " " + sort_direction)
    @active_offers = Offer.where(active: true)
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    @order = Order.new
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to offers_path, notice: 'Angebot erfolgreich erstellt' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Angebot erfolgreich aktualisiert' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Angebot erfolgreich gelöscht' }
      format.json { head :no_content }
    end
  end

  def create_order
    @order = Order.new(order_params)
    @offer = Offer.find(params[:id])

    respond_to do |format|
      if @order.save
        format.html { redirect_to @offer, notice: 'Anfrage versendet! Es wird sich in den kommenden Tagen jemand von uns bei Ihnen melden' }
        format.json { render :index, status: :created, location: @offer }
      else
        format.html { render :show }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_offer
    @offer = Offer.find(params[:id])
  end

  def sort_column
    params[:sort] || "active"
  end

  def sort_direction
    params[:direction] || "desc"
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def offer_params
    params.require(:offer).permit(
      :image,
      :name,
      :description,
      :created_at,
      :quantity,
      :cost,
      :active
    )
  end

  def order_params
    params.require(:order).permit(
      :quantity,
      :received_at,
      :firstname,
      :lastname,
      :telephone,
      :email,
      :street,
      :zip,
      :city,
      :comment,
      :finished,
      :offer_id
    )
  end
end
