class CoursesController < ApplicationController
before_filter :authorize, :except => [:index, :show]
  # GET /courses.json
  def index
    if admin?
      @courses = Course.all
    else 
      @courses = User.find(session[:user_id]).courses if session[:user_id]
    end 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end




  def add_student
    @course = Course.find(params[:id])
    
    user_to_add = User.find_by(uni: params[:uni])
    if (user_to_add) 
      logger.info user_to_add.uni
      @course.users << user_to_add
      user_to_add.courses << @course
      @course.save
      user_to_add.save
      redirect_to @course, notice: 'Student was successfully created.'

    end

  
    #@course.update_attributes(params[:course])
   
   # end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  

end
