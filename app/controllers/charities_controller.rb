class CharitiesController < ApplicationController
  before_action :set_charity, only: [:update, :edit, :show, :destroy]

  def index
    @charities = policy_scope(Charity)
  end

  def new
    @charity = Charity.new
    authorize @charity
  end

  def create
    @charity = Charity.new(charity_params)
    authorize @charity
    if @charity.save
      redirect_to charity_path(@charity)
    else
      render :new
    end
  end

  def update
    if @charity.update(charity_params)
      redirect_to charity_path(@charity)
    else
      render :edit
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @charity.destroy
    redirect_to charities_path
  end

  private

  def set_charity
    @charity = Charity.find(params[:id])
    authorize @charity
  end

  def charity_params
    params.require(:charity).permit(:name, :immatriculation, :address, :phone_number, :email, :contact_name, :description, :photo)
  end
end
