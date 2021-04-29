class MarksController < ApplicationController
	def make_letter(p)
        return "F" if p < 60
        return "C" if p >= 60 && p < 75
        return "B" if p >= 75 && p < 90
        return "A" if p >= 90
    end
    
    def new
        @report = Report.find(params[:report_id])
        @mark = Mark.new
    end

    def create
                @reports = Report.all
        @marks = Mark.all
        @report = Report.find(params[:report_id])
        @mark = @report.marks.create(params.require(:mark).permit(:points))
		if @mark.save
            @mark.letter = make_letter(@mark.points.to_i)
            @mark.save
			render template: "reports/index" , flash: {success: "Mark was added"}
		else
			render :new, flash: {alert: "Some error occured"}
		end
    end
end
