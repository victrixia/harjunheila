class RsvpsController < ApplicationController
  before_action :set_rsvp, only: [:show, :edit, :update, :destroy]
  before_action :set_options, only: [:new, :edit]
  before_action :ensure_that_signed_in
  before_action :ensure_that_admin, only: [:destroy, :index]

  # GET /rsvps
  # GET /rsvps.json
  def index
    @rsvps = Rsvp.all
  end

  # GET /rsvps/1
  # GET /rsvps/1.json
  def show
  end

  # GET /rsvps/new
  def new
    @rsvp = Rsvp.new
    unless current_user.rsvp.nil?
      redirect_to edit_rsvp_path(current_user.rsvp)
    end
  end

  # GET /rsvps/1/edit
  def edit

  end

  # POST /rsvps
  # POST /rsvps.json
  def create
    @rsvp = Rsvp.new(rsvp_params)

    respond_to do |format|
      if @rsvp.save
        # @rsvp.user = current_user
        # current_user.rsvp = @rsvp
        format.html { redirect_to @rsvp, notice: 'Vastaus luotu onnistuneesti!' }
        format.json { render :show, status: :created, location: @rsvp }
      else
        format.html { render :new }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rsvps/1
  # PATCH/PUT /rsvps/1.json
  def update
    respond_to do |format|
      if @rsvp.update(rsvp_params) and current_user == @rsvp.user
        format.html { redirect_to @rsvp, notice: 'Vastaus päivitetty onnistuneesti!' }
        format.json { render :show, status: :ok, location: @rsvp }
      else
        format.html { render :edit }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rsvps/1
  # DELETE /rsvps/1.json
  def destroy
    @rsvp.destroy
    respond_to do |format|
      format.html { redirect_to rsvps_url, notice: 'Rsvp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rsvp
      @rsvp = Rsvp.find(params[:id])
    end

    def set_options
      @foods = ["Kaikkiruokainen", "Kasvis", "Vegaani", "Gluteeniton", "Muu, mikä:"]
      @drink = ["...lempijuomaani alkoholia!", "...vain alkoholittomia juomia!", "...kohtuudella"]
      @sauna = ["...naisten vuoro on erikseen.", "...miesten vuoro on erikseen.", "...siellä on NAISIAAA","...siellä on MIEHIÄÄÄ","...ihan sama, koen tällaisen sukupuolijaottelun vanhanaikaiseksi."]
      @stars = ["Star Wars", "Star Trek"]
      @sheriffi = ["*", "**", "***"]
      @cola = ["Coca Cola", "Pepsi"]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rsvp_params
      params.require(:rsvp).permit(:name, :attending, :food, :drink, :sauna, :wishlist, :stars, :coke, :sheriff, :other, :user_id)
    end
end
