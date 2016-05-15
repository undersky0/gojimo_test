class QualificationsController < ApplicationController
  before_action :set_qualification, only: [:show]

  def index
    @qualifications = JSON.parse(Net::HTTP.get(URI(Qualification::BASE_URI)))
    fresh_when(@qualifications)
  end

  def show
  end

  private
    def set_qualification
      @qualification = JSON.parse(Net::HTTP.get(URI(Qualification::BASE_URI + params[:id])))
    end
end
