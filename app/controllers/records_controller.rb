class RecordsController < ApplicationController

  # POST /sms
  def update  
	  meeting = Meeting.find_by auth: params[:Body]
	  if meeting
	    student = Student.find_by number: params[:From], course_id: meeting[:course_id]
		if student
		  #to do actually update record if successful
	      @message = "Thank you. Your attendance has been recorded."
		else
		  cookies[:meeting_id] = meeting[:id]
	      @message = "What is your official first name?"
		end
	  elsif cookies[:meeting_id]#&& student != nil
	    if cookies[:first]
	      #create student   
	      cookies.delete :meeting_id
		  cookies.delete :first
	      #to do actually update record if successful
	      @message = "Thank you. Your attendance has been recorded."	    
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
