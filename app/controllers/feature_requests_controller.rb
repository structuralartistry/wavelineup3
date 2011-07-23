class FeatureRequestsController < ApplicationController

  def index

  end

  def new
    @feature_request = FeatureRequest.new
    render 'feature_request'
  end

  def edit
    @feature_request = FeatureRequest.find(params[:id])
    render 'feature_request'
  end

  def create
    @feature_request = FeatureRequest.new(params[:feature_request])

    if @feature_request.save
      redirect_to(feature_requests_path, :notice => 'Feature request was successfully created')
    else
      render 'feature_request'
    end
  end

  def update
    @feature_request = FeatureRequest.find(params[:id])

    if @feature_request.update_attributes(params[:feature_request])
      redirect_to(feature_requests_path, :notice => 'Feature request was successfully updated')
    else
      render 'feature_request'
    end
  end

  def destroy
    @feature_request = FeatureRequest.find(params[:id])
    flash[:notice] = 'Feature Request successfully deleted' if @feature_request.destroy
    redirect_to(feature_requests_path, :notice => 'Feature request was successfully deleted')
  end
end
