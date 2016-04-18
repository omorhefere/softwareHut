class SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: [:show, :edit, :update, :destroy]

  authorize_resource

  # GET /subcategories
  def index
    @subcategories = Subcategory.all
  end

  # GET /subcategories/1
  def show
  end

  # GET /subcategories/new
  def new
    @subcategory = Subcategory.new
  end

  # GET /subcategories/1/edit
  def edit
  end

  # POST /subcategories
  def create
    @subcategory = Subcategory.new(subcategory_params)

    if @subcategory.save
      redirect_to @subcategory, notice: 'Subcategory was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /subcategories/1
  def update
    if @subcategory.update(subcategory_params)
      redirect_to @subcategory, notice: 'Subcategory was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /subcategories/1
  def destroy
    @subcategory.destroy
    redirect_to subcategories_url, notice: 'Subcategory was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subcategory
      @subcategory = Subcategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subcategory_params
      params.require(:subcategory).permit(:name)
    end
end
