class FeedbackSupportsController < ApplicationController
  # GET /feedback_supports
  # GET /feedback_supports.xml
  def index
    @feedback_supports = FeedbackSupport.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @feedback_supports }
    end
  end

  # GET /feedback_supports/1
  # GET /feedback_supports/1.xml
  def show
    @feedback_support = FeedbackSupport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @feedback_support }
    end
  end

  # GET /feedback_supports/new
  # GET /feedback_supports/new.xml
  def new
    @feedback_support = FeedbackSupport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @feedback_support }
    end
  end

  # GET /feedback_supports/1/edit
  def edit
    @feedback_support = FeedbackSupport.find(params[:id])
  end

  # POST /feedback_supports
  # POST /feedback_supports.xml
  def create
    @feedback_support = FeedbackSupport.new(params[:feedback_support])

    respond_to do |format|
      if @feedback_support.save
        format.html { redirect_to(@feedback_support, :notice => 'Feedback support was successfully created.') }
        format.xml  { render :xml => @feedback_support, :status => :created, :location => @feedback_support }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @feedback_support.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /feedback_supports/1
  # PUT /feedback_supports/1.xml
  def update
    @feedback_support = FeedbackSupport.find(params[:id])

    respond_to do |format|
      if @feedback_support.update_attributes(params[:feedback_support])
        format.html { redirect_to(@feedback_support, :notice => 'Feedback support was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @feedback_support.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /feedback_supports/1
  # DELETE /feedback_supports/1.xml
  def destroy
    @feedback_support = FeedbackSupport.find(params[:id])
    @feedback_support.destroy

    respond_to do |format|
      format.html { redirect_to(feedback_supports_url) }
      format.xml  { head :ok }
    end
  end
end
