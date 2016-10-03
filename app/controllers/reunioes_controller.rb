class ReunioesController < ApplicationController
  before_action :set_reuniao, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!
  respond_to :html
  before_filter :get_usuario


  # GET /reunioes
  # GET /reunioes.json
  def index

  @reunioes = @usuario.reunioes [:current_usuario]
    respond_to do |format|
      format.html
    end

    @pdescricao = params[:pdescricao]
    @pdataini = params[:pdataini]
    @pdatafinal = params[:pdataini]

  filtro = "1=1"

  if not(@pdescricao.nil?)
      filtro = filtro + " and descricao like '%"+@pdescricao+"%'"
  end

  if @pdataini.present?
     filtro = filtro + "and data >= '#{@pdataini}'"
    end
    if @pdatafinal.present?
     filtro = filtro + " and data <= '#{@pdatafinal}'"
    end

  @reunioes = @usuario.reunioes(Reuniao.where(filtro).order("data")).paginate(page: params[:page], per_page: 5)

  end



  # GET /reunioes/1
  # GET /reunioes/1.json
  def show

    @reuniao = @usuario.reunioes.includes(:pautas).find params[:id]
    @pautas = @reuniao.pautas
    @reuniao = @usuario.reunioes.includes(:atas).find params[:id]
    @atas = @reuniao.atas
    respond_to do |format|
      format.html
    end
  end

  # GET /reunioes/new
  def new
    @reuniao = Reuniao.new

  end

  # GET /reunioes/1/edit
  def edit
    @reuniao = @usuario.reunioes.find params[:id]
    respond_with @reuniao
  end

  # POST /reunioes
  # POST /reunioes.json
  def create
    @reuniao = Reuniao.new(reuniao_params)
    @reuniao.usuario_id = current_usuario.id
    respond_to do |format|
      if @reuniao.save
        format.html { redirect_to @reuniao }
        format.json { render :show, status: :created, location: @reuniao }
      else
        format.html { render :new }
        format.json { render json: @reuniao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reunioes/1
  # PATCH/PUT /reunioes/1.json
  def update
    respond_to do |format|
      if @reuniao.update(reuniao_params)
        format.html { redirect_to @reuniao }
        format.json { render :show, status: :ok, location: @reuniao }
      else
        format.html { render :edit }
        format.json { render json: @reuniao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reunioes/1
  # DELETE /reunioes/1.json
  def destroy
    @reuniao.destroy
    respond_to do |format|
      format.html { redirect_to reunioes_url }
      format.json { head :no_content }
    end
  end

    def listar
    @reunioes = Reuniao.all.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReunioesReport.new(@reunioes)
        send_data pdf.render, filename: 'reunioesListagem.pdf', :width => pdf.bounds.width,
        type: 'application/pdf', disposition: :inline, :page_size => "A4", :page_layout => :portrait
      end
    end
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reuniao
      @reuniao = Reuniao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reuniao_params
      params.require(:reuniao).permit(:codigo, :descricao, :data, :hora, :local, :convidados, :gerencia_id, :observacoes, :coordreuniao_id, :usuario_id)
    end

    def get_usuario
      @usuario= current_usuario    
    end

  end
