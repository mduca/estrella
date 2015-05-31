class ScreeningController < ApplicationController

	def question_1
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

	def question_1_sub_1

	end

	def question_2

	end

	def question_2_sub_1

	end

	def question_3

	end

	def question_4

	end

	def question_5

	end

	def question_6

	end

	def question_7

	end

	def question_8

	end

	def question_9

	end

	def question_9_sub_1

	end

	def question_9_sub_2

	end

	def question_9_sub_3

	end

	def question_9_sub_4

	end



end
