class HomeController < ApplicationController
  def index

    respond_to do |format|
      format.html
    end
  end

  def add_line
    @line = params[:line]

    TwilioClient.send_text_message("3108823949")
    
    respond_to do |format|
      format.html
    end
  end
end
