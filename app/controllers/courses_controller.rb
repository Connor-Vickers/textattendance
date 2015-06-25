class CoursesController < ApplicationController
  before_action do add_breadcrumb "Courses", :courses_path end
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  
  #, :courses_path

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.where("user_id = ?",  @user.id)
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @sorted_meetings = @course.meetings.sort_by(&:when)
	  @sorted_students = @course.students.sort_by(&:last)
    respond_to do |format|
      format.html
      format.csv
    end
  end

  # GET /courses/new
  def new
    @course = Course.new
    add_breadcrumb "New"
  end

  # GET /courses/1/edit
  def edit
    add_breadcrumb "Edit"
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to courses_path, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
      add_breadcrumb @course.name, course_path(@course)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
    ret_params = params.require(:course).permit(:name, :user_id)
	  ret_params[:user_id] = @user.id
	  return ret_params
    end
end
