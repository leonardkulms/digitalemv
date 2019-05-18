# frozen_string_literal: true

class MutationsController < ApplicationController
  before_action :set_mutation, only: %i[agree disagree abstain]
  before_action :set_mutation2, only: %i[edit update destroy]
  skip_before_action :admin_zone, only: %i[agree disagree abstain]

  def new
    @mutation = current_user.meetings.find(params[:meeting]).mutations.build
    @meeting = current_user.meetings.find(params[:meeting])
  end

  def create
    @mutation = current_user.meetings.find(params[:meeting]).mutations.new(mutation_params)

    respond_to do |format|
      if @mutation.save
        format.html { redirect_to @mutation.meeting, only_path: true }
        format.json { render :show, status: :created, location: @mutation.meeting }
      else
        format.html { render :new }
        format.json { render json: @mutation.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @mutation.update(mutation_params)
        format.html { redirect_to @meeting, only_path: true, notice: 'Satzungsänderung erfolgreich bearbeitet.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mutation.destroy
    respond_to do |format|
      format.html { redirect_to meeting, only_path: true, notice: 'Satzungsänderung erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  def agree
    @agreement = Agreement.create!(user: current_user, mutation: @mutation, status: :positive)
    redirect_to @mutation.meeting, only_path: true
  end

  def disagree
    @agreement = Agreement.create!(user: current_user, mutation: @mutation, status: :negative)
    redirect_to @mutation.meeting, only_path: true
  end

  def abstain
    @agreement = Agreement.create!(user: current_user, mutation: @mutation, status: :neutral)
    redirect_to @mutation.meeting, only_path: true
  end

  private

  def set_mutation
    @mutation = Mutation.find(params[:mutation])
  end

  def set_mutation2
    @mutation = Mutation.find(params[:id])
    @meeting = @mutation.meeting
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def mutation_params
    params.require(:mutation).permit(:description)
  end
end
