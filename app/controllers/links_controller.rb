class LinksController < ApplicationController
  def show
    @link = Link.find_by(code: params[:code])
    redirect_to @link.url
  end

  def create
    shortener = Shortener.new(link_params[:url])
    @link = shortener.generate_link

    if @link.save
      render :create
    else
      render 'error.js.erb'
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
