class TransacsController < ApplicationController
  before_action :set_transac, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /transacs or /transacs.json
  def index
    @category = Category.find(params[:category_id])
    @transacs = @category.transacs.order(created_at: :desc)
    @total_amount = @transacs.sum(:amount)
  end

  # GET /transacs/1 or /transacs/1.json
  def show; end

  # GET /transacs/new
  def new
    @categories = Category.where(author_id: current_user, id: params[:category_id])
    @category = Category.find(params[:category_id])
    @transac = @category.transacs.build
  end

  # GET /transacs/1/edit
  def edit; end

  # POST /transacs or /transacs.json
  def create
    @category = Category.find(params[:category_id])
    @transac = @category.transacs.build(transac_params)
    @transac.author_id = current_user.id
    respond_to do |format|
      if @transac.save
        @transac.categories.push(Category.find(params[:category_id]))
        format.html { redirect_to category_transacs_path(@category), notice: 'Transac was successfully created.' }
        format.json { render :show, status: :created, location: @transac }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transac.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transacs/1 or /transacs/1.json
  def update
    respond_to do |format|
      if @transac.update(transac_params)
        format.html { redirect_to transac_url(@transac), notice: 'Transac was successfully updated.' }
        format.json { render :show, status: :ok, location: @transac }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transac.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transacs/1 or /transacs/1.json
  def destroy
    @transac.destroy

    respond_to do |format|
      format.html { redirect_to transacs_url, notice: 'Transac was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transac
    @transac = Transac.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transac_params
    params.require(:transac).permit(:name, :amount, :author_id)
  end
end
