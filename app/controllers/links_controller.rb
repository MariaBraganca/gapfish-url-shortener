class LinksController < ApplicationController
  def show
    @link = Link.find_by(code: params[:code])
    redirect_to @link.url
  end

  def create
    shortener = Shortener.new(link_params[:url])
    @link = shortener.generate_link
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
