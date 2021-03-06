# frozen_string_literal: true

class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[show edit update destroy users]
  skip_before_action :admin_zone, only: %i[index show]
  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
  end

  def users
    if @meeting.mutations.first
      @firstagreements = @meeting.mutations.first.agreements
      @lastagreements = @meeting.mutations.last.agreements
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    # @agreements = @meeting.agreements
  end

  # GET /meetings/new
  def new
    @meeting = current_user.meetings.build
  end

  # GET /meetings/1/edit
  def edit; end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = current_user.meetings.new(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, only_path: true, notice: 'Mitgliederversammlung erfolgreich erstellt.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, only_path: true, notice: 'Mitgliederversammlung erfolgreich bearbeitet.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, only_path: true, notice: 'Mitgliederversammlung erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def meeting_params
    params.require(:meeting).permit(:name, :description)
  end
end
