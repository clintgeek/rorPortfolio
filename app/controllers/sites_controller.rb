class SitesController < ApplicationController
  http_basic_authenticate_with name: "portfolio", password: "admin", except: [:index]

  def admin
    @sites = Site.all
  end

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
  end

  def new
    @site = Site.new
  end

  def edit
    @site = Site.find(params[:id])
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to controller: 'sites', action: 'admin'
    else
      render 'new'
    end
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      redirect_to controller: 'sites', action: 'admin'
    else
      render 'edit'
    end
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to controller: 'sites', action: 'admin'
  end

  private
    def site_params
      params.require(:site).permit(:title, :desc, :button_text, :site_url, :img_url_sm, :img_url_lg)
    end
end
