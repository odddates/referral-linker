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

  def show
    link = Link.find_by(title: params[:id])
    link.update!(views: link.views + 1)

    redirect_to landing_links_path(link: link.title)
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])

    if @link.update(link_params)
      redirect_to :links
    else
      render :edit
    end
  end

  def destroy
    @link = Link.find(params[:id])

    if @link.destroy
      redirect_to :links
    else
      #display error
    end
  end

  def landing
  end

  private

  def link_params
    params.require(:link).permit(:title)
  end
end
