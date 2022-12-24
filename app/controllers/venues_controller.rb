#---
# Excerpted from "Modern Front-End Development for Rails, Second Edition",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/nrclient2 for more book information.
#---
class VenuesController < ApplicationController
  before_action :set_venue, only: %i[show edit update destroy]

  # GET /venues or /venues.json
  def index
    @venues = Venue.all
  end

  # GET /venues/1 or /venues/1.json
  def show
  end

  # GET /venues/new
  def new
    @venue = Venue.new
  end

  # GET /venues/1/edit
  def edit
  end

  # POST /venues or /venues.json
  def create
    @venue = Venue.new(venue_params)

    respond_to do |format|
      if @venue.save
        format.html { redirect_to @venue, notice: "Venue was successfully created." }
        format.json { render :show, status: :created, location: @venue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venues/1 or /venues/1.json
  def update
    respond_to do |format|
      if @venue.update(venue_params)
        format.html { redirect_to @venue, notice: "Venue was successfully updated." }
        format.json { render :show, status: :ok, location: @venue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1 or /venues/1.json
  def destroy
    @venue.destroy
    respond_to do |format|
      format.html { redirect_to venues_url, notice: "Venue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_venue
    @venue = Venue.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def venue_params
    params.require(:venue).permit(:name, :description, :rows, :seats_per_row)
  end
end
