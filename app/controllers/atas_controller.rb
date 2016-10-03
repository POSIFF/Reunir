class AtasController < ApplicationController
  respond_to :html
  before_filter :get_reuniao
  before_action :set_ata, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /atas
  # GET /atas.json
  def index
    @atas = @reuniao.atas
    respond_to do |format|
      format.html
    end
  end

  def show
    @ata = @reuniao.atas.find params[:id]
    respond_to do |format|
      format.html
    end
  end

  def new
    @ata = @reuniao.atas.new
    respond_with @ata
  end

  def edit
    @ata = @reuniao.atas.find params[:id]
    respond_with @ata
  end

  # POST /atas
  # POST /atas.json
  def create
    @ata = @reuniao.atas.create(ata_params)

    respond_to do |format|
      if @ata.save
        format.html { redirect_to @reuniao}
        format.json { render :show, status: :created, location: @ata }
      else
        format.html { render :new }
        format.json { render json: @ata.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @ata = @reuniao.atas.find params[:id]
    respond_to do |format|
      if @ata.update(ata_params)
        format.html { redirect_to @reuniao}
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
    @ata = @reuniao.atas.find params[:id]
    @ata.destroy
    respond_to do |format|
      format.html { redirect_to @reuniao}
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
      params.require(:ata).permit(:codigo, :descricao, :autor, :reuniao_id)
    end

    def get_reuniao
      @reuniao = Reuniao.find params[:reuniao_id]
    end
end