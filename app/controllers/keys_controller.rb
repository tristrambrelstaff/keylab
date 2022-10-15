class KeysController < ApplicationController

  before_action :authenticate_admin!, :only => [:create, :update, :destroy]

  # GET /keys or /keys.json
  def index
    searcher = Key.searcher(params)
    @keys = Key.
      joins(searcher.joins.join(" ")).
      where([searcher.conds.join(" AND "), *searcher.vals]).
      paginate(page: params[:page])
  end

  # GET /keys/search
  def search
  end

  # GET /keys/1 or /keys/1.json
  def show
    @key = Key.find(params[:id])
  end

  # GET /keys/new
  def new
    @key = Key.new
  end

  # POST /keys or /keys.json
  def create
    @key = Key.new(key_params)
    respond_to do |format|
      if @key.save
        format.html { redirect_to key_url(@key), notice: "Key was successfully created." }
        format.json { render :show, status: :created, location: @key }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keys/1 or /keys/1.json
  def destroy
    @key = Key.find(params[:id])
    @key.destroy
    respond_to do |format|
      format.html { redirect_to keys_url, notice: "Key was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def key_params
      params.require(:key).permit(:xml)
    end

end
