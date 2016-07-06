# Interface to interact with Insitutions.
class InstitutionsController < ApplicationController
  include ActionController::Serialization

  before_action :set_institution, only: [:show, :update, :destroy]

  # GET /institutions
  # GET /institutions.json
  def index
    @institutions = Institution.all

    render json: @institutions
  end

  # GET /institutions/1
  # GET /institutions/1.json
  def show
    render json: @institution
  end

  # POST /institutions
  # POST /institutions.json
  def create
    @institution = Institution.new(institution_params)

    if @institution.save
      render json: @institution, status: :created, location: @institution
    else
      render json: @institution.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /institutions/1
  # PATCH/PUT /institutions/1.json
  def update
    @institution = Institution.find(params[:id])

    if @institution.update(institution_params)
      head :no_content
    else
      render json: @institution.errors, status: :unprocessable_entity
    end
  end

  # DELETE /institutions/1
  # DELETE /institutions/1.json
  def destroy
    @institution.destroy

    head :no_content
  end

  private

  def set_institution
    @institution = Institution.find(params[:id])
  end

  def institution_params
    params.require(:institution).permit(
      :name, :location, :president_id, :website, :twitter_handle,
      :facebook_page, :youtube_channel, :founded_at
    )
  end
end
