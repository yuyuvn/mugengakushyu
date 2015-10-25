class KanjisController < ApplicationController
  before_action :set_kanji, only: [:show, :edit, :update, :destroy]

  # GET /kanjis
  # GET /kanjis.json
  def index
    @kanjis = Kanji.all
  end

  # GET /kanjis/1
  # GET /kanjis/1.json
  def show
  end

  # GET /kanjis/new
  def new
    @kanji = Kanji.new
  end

  # GET /kanjis/1/edit
  def edit
  end

  # POST /kanjis
  # POST /kanjis.json
  def create
    @kanji = Kanji.new(kanji_params)

    respond_to do |format|
      if @kanji.save
        format.html { redirect_to @kanji, notice: 'Kanji was successfully created.' }
        format.json { render :show, status: :created, location: @kanji }
      else
        format.html { render :new }
        format.json { render json: @kanji.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kanjis/1
  # PATCH/PUT /kanjis/1.json
  def update
    respond_to do |format|
      if @kanji.update(kanji_params)
        format.html { redirect_to @kanji, notice: 'Kanji was successfully updated.' }
        format.json { render :show, status: :ok, location: @kanji }
      else
        format.html { render :edit }
        format.json { render json: @kanji.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kanjis/1
  # DELETE /kanjis/1.json
  def destroy
    @kanji.destroy
    respond_to do |format|
      format.html { redirect_to kanjis_url, notice: 'Kanji was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kanji
      @kanji = Kanji.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kanji_params
      params.require(:kanji).permit(:text, :mean, :other_mean, :kun, :on)
    end
end
