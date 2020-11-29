class LinksController < ApplicationController

  def create
    shortener = Shortener.new(link_params[:url])
    @link = shortener.generate_link
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
