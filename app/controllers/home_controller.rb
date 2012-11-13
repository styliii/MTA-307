class HomeController < ApplicationController
  def index

    respond_to do |format|
      format.html
    end
  end

  def add_line
    @line = params[:line]

    respond_to do |format|
      format.html
    end
  end
end
