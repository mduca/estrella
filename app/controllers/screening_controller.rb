class ScreeningController < ApplicationController

	def question1
		@question = :question_1
		@options = ["Yes", "No"]
		@info = "the info text"
		render: question_template

		if request.post?
			if params["answer"] == "yes"
				redirect_to: question1sub2

				@current_path.question_1 = params["answer"]

				# or final
				@filter
				redirect_to: result_page
			else

			end

		end


	end




end
