class TransacCategoriesController < ApplicationController
  before_action :set_transac_category, only: %i[show edit update destroy]

  # GET /transac_categories or /transac_categories.json
  def index
    @transac_categories = TransacCategory.all
  end

  # GET /transac_categories/1 or /transac_categories/1.json
  def show; end

  # GET /transac_categories/new
  def new
    @transac_category = TransacCategory.new
  end

  # GET /transac_categories/1/edit
  def edit; end

  # POST /transac_categories or /transac_categories.json
  def create
    @transac_category = TransacCategory.new(transac_category_params)

    respond_to do |format|
      if @transac_category.save
        format.html do
          redirect_to transac_category_url(@transac_category), notice: 'Transac category was successfully created.'
        end
        format.json { render :show, status: :created, location: @transac_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transac_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transac_categories/1 or /transac_categories/1.json
  def update
    respond_to do |format|
      if @transac_category.update(transac_category_params)
        format.html do
          redirect_to transac_category_url(@transac_category), notice: 'Transac category was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @transac_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transac_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transac_categories/1 or /transac_categories/1.json
  def destroy
    @transac_category.destroy

    respond_to do |format|
      format.html { redirect_to transac_categories_url, notice: 'Transac category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transac_category
    @transac_category = TransacCategory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transac_category_params
    params.require(:transac_category).permit(:category_id, :transac_id)
  end
end
