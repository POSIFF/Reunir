class AtasController < ApplicationController
  before_action :set_ata, only: [:show, :edit, :update, :destroy]

  # GET /atas
  # GET /atas.json
  def index
    @atas = Ata.all
  end

  # GET /atas/1
  # GET /atas/1.json
  def show
  end

  # GET /atas/new
  def new
    @ata = Ata.new
  end

  # GET /atas/1/edit
  def edit
  end

  # POST /atas
  # POST /atas.json
  def create
    @ata = Ata.new(ata_params)

    respond_to do |format|
      if @ata.save
        format.html { redirect_to @ata, notice: 'Ata was successfully created.' }
        format.json { render :show, status: :created, location: @ata }
      else
        format.html { render :new }
        format.json { render json: @ata.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atas/1
  # PATCH/PUT /atas/1.json
  def update
    respond_to do |format|
      if @ata.update(ata_params)
        format.html { redirect_to @ata, notice: 'Ata was successfully updated.' }
        format.json { render :show, status: :ok, location: @ata }
      else
        format.html { render :edit }
        format.json { render json: @ata.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atas/1
  # DELETE /atas/1.json
  def destroy
    @ata.destroy
    respond_to do |format|
      format.html { redirect_to atas_url, notice: 'Ata was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ata
      @ata = Ata.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ata_params
      params.require(:ata).permit(:codigo, :descricao, :autor)
    end
end
