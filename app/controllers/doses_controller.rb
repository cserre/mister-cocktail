class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create, :destroy]
  # retirer le destroy ci-dessus pour faire plaisir au rake
  before_action :set_dose, only: [:destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.create(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
      # render :new
    end
  end

  def destroy
    @dose.delete
    # redirect_to cocktails_path - a ajouter pour faire plaisir au rake
    redirect_to cocktail_path(@cocktail)
  end

  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
  def set_dose
    @dose = Dose.find(params[:id])
  end
  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
