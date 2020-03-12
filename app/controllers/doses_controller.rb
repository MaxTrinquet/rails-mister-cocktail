class DosesController < ApplicationController
  def create
    # @coktail = Coktail.find(params[:id])

    @dose = Dose.create(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.save

    redirect_to cocktails_path(@cocktail)
  end
  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
