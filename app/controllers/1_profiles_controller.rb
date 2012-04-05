class ProfilesController < ApplicationController

  before_filter :check_for_profile,:only=>[:create]
  def my_profile
    @profile=current_user.profile

    unless(@profile)
      @profile=Profile.new(params[:id])
    end
  end

  def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  def new
    @profile = Profile.new(params[:id])
  end

  def create
    data=Hash.new
    data=params[:profile]
    data[:user_id]=current_user.id
    @profile = Profile.new(data)
    respond_to do |format|
      if @profile.save
        format.html { redirect_to(my_profile_profiles_path,
          :notice => 'Profile was successfully created.') }
        format.xml  { render :xml => @profile, :status => :created,
          :location => @profile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    data=Hash.new
    data=params[:profile]
    data[:user_id]=current_user.id
    respond_to do |format|
      if @profile.update_attributes(data)
        format.html { redirect_to my_profile_profiles_path, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def check_for_profile
    if(current_user.profile)
      redirect_to(root_path, :notice => 'Profile already exists.')
    end
  end

end
