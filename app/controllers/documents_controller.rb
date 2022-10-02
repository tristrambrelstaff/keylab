class DocumentsController < ApplicationController

  before_action :authenticate_admin!, :only => [:create, :update, :destroy]

  # GET /documents or /documents.json
  def index
    searcher = Document.searcher(params)
    @documents = Document.
      joins(searcher.joins.join(" ")).
      where([searcher.conds.join(" AND "), *searcher.vals]).
      paginate(page: params[:page])
  end

  # GET /documents/search
  def search
  end

  # GET /documents/1?delete=1 or /documents/1.json
  def show
    @document = Document.find(params[:id])
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # POST /documents or /documents.json
  def create
    @document = Document.new(document_params)
    respond_to do |format|
      if @document.save
        format.html { redirect_to document_url(@document), notice: "Document was successfully created." }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1 or /documents/1.json
  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: "Document was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def document_params
      params.require(:document).permit(:ref, :citation, :language, :original_file_url, :archived_file_url, :original_page_url, :archived_page_url)
    end

end
