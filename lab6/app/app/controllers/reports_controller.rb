class ReportsController < ApplicationController
	#Read
	def index
		@reports = Report.all
		@marks = Mark.all
	end

	#Create	
	def new
		@report = Report.new
	end
	
	def create
		report = Report.new(params.require(:report).permit(:title, :description))
		if report.save
			redirect_to action: :index, flash: {success: "Report was added"}
		else
			render :new, flash: {alert: "Some error occured"}
		end
	end

	#Destroy
	def destroy
		@report = Report.find(params[:id])
		@report.destroy

		redirect_to action: :index
	end
end
