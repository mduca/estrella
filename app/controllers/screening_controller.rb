class ScreeningController < ApplicationController
	 layout "guided"
  
	def question_1

		unless request.post?
			@question = :question_1  #locale key to get question string
			@options = [:question_1_option_1, :question_1_option_2] #array of keys of options to get answers
			@info = :question_1_info #locale key to get info

			render "screening/question"

		else
			if params["answer"] == "question_1_option_1"

				redirect_to action: :question_1_sub_1
			else
				redirect_to :root
			end

		end
	end

	def question_1_sub_1
		unless request.post?

			@question = :question_1_sub_1  #locale key to get question string
			@options = [:question_1_sub_1_option_1, :question_1_sub_1_option_2] #array of keys of options to get answers
			@info = :question_1_sub_1_info #locale key to get info


			render "screening/question"

		else
			if params["answer"] == "question_1_option_1"

				redirect_to action: :question_1_sub_1
			else
				redirect_to :root
			end

		end

	end

	def question_2

		unless request.post?
			@question = :question_2  #locale key to get question string
			@options = [:question_2_option_1, :question_2_option_2] #array of keys of options to get answers
			@info = :question_2_info #locale key to get info

			render "screening/question"

		else
			if params["answer"] == "question_2_option_1"

				redirect_to action: :question_2_sub_1
			else
				redirect_to :root
			end

		end
	end



	end

	def question_2_sub_1
		unless request.post?

			@question = :question_2_sub_1  #locale key to get question string
			@options = [:question_2_sub_1_option_1, :question_2_sub_1_option_2] #array of keys of options to get answers
			@info = :question_2_sub_1_info #locale key to get info


			render "screening/question"

		else
			if params["answer"] == "question_2_option_1"

				redirect_to action: :question_2_sub_1
			else
				redirect_to :root
			end

		end

	end


	def question_3

		unless request.post?
			@question = :question_1  #locale key to get question string
			@options = [:question_1_option_1, :question_1_option_2] #array of keys of options to get answers
			@info = :question_1_info #locale key to get info

			render "screening/question"

		else
			if params["answer"] == "question_1_option_1"

				redirect_to action: :question_1_sub_1
			else
				redirect_to :root
			end

		end
	end


	end

	def question_4

		unless request.post?
			@question = :question_1  #locale key to get question string
			@options = [:question_1_option_1, :question_1_option_2] #array of keys of options to get answers
			@info = :question_1_info #locale key to get info

			render "screening/question"

		else
			if params["answer"] == "question_1_option_1"

				redirect_to action: :question_1_sub_1
			else
				redirect_to :root
			end

		end
	end


	end

	def question_5

		unless request.post?
			@question = :question_1  #locale key to get question string
			@options = [:question_1_option_1, :question_1_option_2] #array of keys of options to get answers
			@info = :question_1_info #locale key to get info

			render "screening/question"

		else
			if params["answer"] == "question_1_option_1"

				redirect_to action: :question_1_sub_1
			else
				redirect_to :root
			end

		end
	end


	end

	def question_6

		unless request.post?
			@question = :question_1  #locale key to get question string
			@options = [:question_1_option_1, :question_1_option_2] #array of keys of options to get answers
			@info = :question_1_info #locale key to get info

			render "screening/question"

		else
			if params["answer"] == "question_1_option_1"

				redirect_to action: :question_1_sub_1
			else
				redirect_to :root
			end

		end
	end


	end

	def question_7

		unless request.post?
			@question = :question_1  #locale key to get question string
			@options = [:question_1_option_1, :question_1_option_2] #array of keys of options to get answers
			@info = :question_1_info #locale key to get info

			render "screening/question"

		else
			if params["answer"] == "question_1_option_1"

				redirect_to action: :question_1_sub_1
			else
				redirect_to :root
			end

		end
	end


	end

	def question_8

		unless request.post?
			@question = :question_1  #locale key to get question string
			@options = [:question_1_option_1, :question_1_option_2] #array of keys of options to get answers
			@info = :question_1_info #locale key to get info

			render "screening/question"

		else
			if params["answer"] == "question_1_option_1"

				redirect_to action: :question_1_sub_1
			else
				redirect_to :root
			end

		end
	end


	end

	def question_9

		unless request.post?
			@question = :question_1  #locale key to get question string
			@options = [:question_1_option_1, :question_1_option_2] #array of keys of options to get answers
			@info = :question_1_info #locale key to get info

			render "screening/question"

		else
			if params["answer"] == "question_1_option_1"

				redirect_to action: :question_1_sub_1
			else
				redirect_to :root
			end

		end
	end


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
