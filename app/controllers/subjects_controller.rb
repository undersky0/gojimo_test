class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show]

  def index
    @subjects = Subject.all
  end

  def show
    flash.now[:notice] = @subject["error"]["message"] if @subject["error"] && @subject["error"]["message"]
  end

  private
    def set_subject
      @subject = JSON.parse(Net::HTTP.get(URI(Subject::BASE_URI + params[:id])))
    end
end
