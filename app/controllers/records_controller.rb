class RecordsController < ApplicationController
  skip_before_filter  :verify_authenticity_token, only: [:update]

  # POST /sms
  def update
    respond_to do |format|
	  
	  #meeting id = Meeting.find_by auth_code: params[:body]#returns meeting not meeting_id
	  student_id = Student.find_by number: params[:from].select("id")
	  #if(mettinf_id != null && student_id != null)
	  #  format.xml { render :recordedattendencesucess }
	  #else if (student_id == null)
	  #  if(meeting_id != null)
	  #	    store cookie meetind_id
	  #     format.xml { render :askfirstname }
	  #  else if(cookie meeting id exist)
	  #    if cookie first exist
	  #       create student 
	  #       delet cookie
	  #       update record
	  #       format.xml { render :recordedattendencesucess }
	  #    else
	  #      store cookie first 
	  #      format.xml { render :asklastname }
	  #else
	  #  format.xml { render :invalidclasscode }
	  #
	  #
	  #
      #if @record.update(record_params)
      #  format.html { redirect_to @record, notice: 'Record was successfully updated.' }
      #  format.json { render :show, status: :ok, location: @record }
	  #end

    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
	  params.require(:record).permit(:value, :student_id, :meeting_id, :From, :Body)
    end
end
