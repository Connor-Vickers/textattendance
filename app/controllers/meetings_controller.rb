class MeetingsController < ApplicationController
  before_action :set_course
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  
  protect_from_forgery except: :newauth 

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
  end

  # GET /meetings/new
  def new  
	@meeting = @course.meetings.new
  add_breadcrumb "New Meeting"
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  def create
    @meeting = @course.meetings.new(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to course_meeting_takeattendance_path(@course, @meeting)}
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /meetings/1
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @course, notice: 'Meeting was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /meetings/1
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to course_path(@course), notice: 'Meeting was successfully destroyed.' }
    end
  end
  
  def takeattendance
  end
  
  def newauth
    meeting = Meeting.find(params[:meeting_id])
    if params[:last] == "true"
      meeting[:auth] = nil
      meeting.save
      render nothing: true
    else
      auth = rand(10000).to_s
      meeting[:auth] = auth
      while !meeting.valid?
        auth = rand(10000).to_s
          meeting[:auth] = auth
      end
      meeting.save
      render inline: auth.to_s
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
      add_breadcrumb @meeting.name
    end
		
    def set_course
      @course = Course.find(params[:course_id])
      add_breadcrumb "Courses", :courses_path
      add_breadcrumb @course.name, course_path(@course)
    end
	
    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:name, :when, :course_id)
    end
end
