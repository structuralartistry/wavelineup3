class FeatureRequestsController < ApplicationController
  def index
    @feature_requests = FeatureRequest.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @feature_request = FeatureRequest.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @feature_request = FeatureRequest.find(params[:id])
  end

  def create
    @feature_request = FeatureRequest.new(params[:feature_request])

    respond_to do |format|
      if @feature_request.save
        format.html { redirect_to(@feature_request, :notice => 'Feature request was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @feature_request = FeatureRequest.find(params[:id])

    respond_to do |format|
      if @feature_request.update_attributes(params[:feature_request])
        format.html { redirect_to(@feature_request, :notice => 'Feature request was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @feature_request = FeatureRequest.find(params[:id])
    @feature_request.destroy

    respond_to do |format|
      format.html { redirect_to(feature_requests_url) }
    end
  end
end
