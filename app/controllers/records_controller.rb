class RecordsController < ApplicationController
  skip_before_filter :set_user
  skip_before_filter :verify_authenticity_token
  # POST /sms
  def create  
	  meeting = Meeting.find_by auth: params[:Body]
	  logger.debug "meeting"
	  logger.debug meeting
	  if meeting
	    student = Student.find_by number: params[:From], course_id: meeting[:course_id]
		if student
		  record = Record.new(student: student, meeting: meeting, value: 1)
		  if record.save
		    @message = "Thank you. Your attendance has been recorded."
		  else 
		    @message = "Sorry, something went wrong."
			#to do record error
	      end
		else
		  cookies[:meeting_id] = meeting[:id]
	      @message = "What is your official first name?"
		end
	  elsif cookies[:meeting_id]
	    if cookies[:first]
		  meeting = Meeting.find(cookies[:meeting_id])
		  course = meeting.course
	      student = Student.new(first: cookies[:first], last: params[:Body], course: course, number: params[:From])  
	      record = Record.new(student: student, meeting: meeting, value: 1)
		  if student.save and record.save
		    @message = "Thank you. Your attendance has been recorded."
		  else 
		    @message = "Sorry, something went wrong."
			#to do record error
            end		  
		  cookies.delete :meeting_id
		  cookies.delete :first    
		else
		  cookies[:first] = params[:Body]
		  @message = "What is your official last name?"
        end
	  else
	    @message = "That is an invalid or expired code. Please try again."
	  end
	  render "response.xml.erb"
  end
end
