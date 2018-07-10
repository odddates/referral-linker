class LinksController < ApplicationController
  def index
    @new_link = Link.new
    @links = Link.all
  end

  def create
    @new_link = Link.new(link_params)

    if @new_link.save
      redirect_to :links
    else
      @links = Link.all
      render :index
    end
  end

  private

  def link_params
    params.require(:link).permit(:id)
  end
end
