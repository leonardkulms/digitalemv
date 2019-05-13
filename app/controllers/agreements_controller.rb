# frozen_string_literal: true

class AgreementsController < ApplicationController
  before_action :set_agreement, only: %i[show edit update destroy]
  skip_before_action :admin_zone, only: %i[new create]

  # GET /agreements/new
  def new
    @agreement = Agreement.new
  end

  # POST /agreements
  # POST /agreements.json
  def create
    @agreement = Agreement.new(agreement_params)

    respond_to do |format|
      if @agreement.save
        format.html { redirect_to @agreement, only_path: true, notice: 'Reaktion wurde erstellt.' }
        format.json { render :show, status: :created, location: @agreement }
      else
        format.html { render :new }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_agreement
    @agreement = current_user.agreements.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def agreement_params
    params.fetch(:agreement, {})
  end
end
