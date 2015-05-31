class ScreeningController < ApplicationController
	layout "guided"
	before_filter :get_current_path, except: [:index]

	def index

		path = Path.new

		path.question_localization = params[:localization]
		path.legal_areas = ""
		path.legal_services = ""
		path.filter_language = params[:locale]

		path.save

		session[:path_id] = path.id
		session[:locale] = params[:locale]
		session[:localization] = params[:localization] # zipcode
		session[:state] = params[:state]
		redirect_to action: :question_1

	end
  
	def question_1

		unless request.post?
			@question = :question_1  #locale key to get question string
			@options = [:question_1_option_1, :question_1_option_2] #array of keys of options to get answers
			@info = :question_1_info #locale key to get info

			render "screening/question"

		else
			@current_path.question_1 = params["answer"]
			@current_path.save

			if params["answer"] == "question_1_option_1"

				redirect_to action: :question_1_sub_1
			else
				redirect_to action: :question_2
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
			@current_path.question_1_sub_1 = params["answer"]
			@current_path.save
			if params["answer"] == "question_1_sub_1_option_1"
				@current_path.filter_area = "6"
				@current_path.save
				redirect_to "/results"
			else
				redirect_to action: :question_4
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
			@current_path.question_2 = params["answer"]
			@current_path.save

			if params["answer"] == "question_2_option_1"

				redirect_to action: :question_2_sub_1
			else
				redirect_to action: :question_3
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
			@current_path.question_2_sub_1 = params["answer"]
			@current_path.save

			if params["answer"] == "question_2_sub_1_option_1"
				@current_path.filter_area = "9"
				@current_path.save
				redirect_to "/results"
			else
				redirect_to action: :question_3
			end

		end

	end


	def question_2_sub_2
		unless request.post?
			@question = :question_2_sub_2  #locale key to get question string
			@options = [:question_2_sub_2_option_1, :question_2_sub_2_option_2] #array of keys of options to get answers
			@info = :question_2_sub_2_info #locale key to get info

			render "screening/question"

		else
			@current_path.question_2_sub_2 = params["answer"]
			@current_path.save

			if params["answer"] == "question_2_sub_2_option_1"
				@current_path.filter_area = "6"
				@current_path.save
				redirect_to "/results"
			else
				redirect_to action: :question_3
			end

		end

	end


	def question_3

		unless request.post?
			@question = :question_3  #locale key to get question string
			@options = [:question_3_option_1, :question_3_option_2] #array of keys of options to get answers
			@info = :question_3_info #locale key to get info

			render "screening/question"

		else
			@current_path.question_3 = params["answer"]
			@current_path.save

			if params["answer"] == "question_3_option_1"
				@current_path.filter_area = "6"
				@current_path.save
				redirect_to "/results"
			else
				redirect_to action: :question_4
			end

		end
	end


	def question_4

		unless request.post?
			@question = :question_4  #locale key to get question string
			@options = [:question_4_option_1, :question_4_option_2] #array of keys of options to get answers
			@info = :question_4_info #locale key to get info

			render "screening/question"

		else
			@current_path.question_4 = params["answer"]
			@current_path.save

			if params["answer"] == "question_4_option_1"
				@current_path.filter_service = "4"
				@current_path.save
				redirect_to "/results"
			else
				redirect_to action: :question_5
			end

		end
	end




	def question_5

		unless request.post?
			@question = :question_5  #locale key to get question string
			@options = [:question_5_option_1, :question_5_option_2] #array of keys of options to get answers
			@info = :question_5_info #locale key to get info

			render "screening/question"

		else
			@current_path.question_5 = params["answer"]
			@current_path.save

			if params["answer"] == "question_5_option_1"

				@current_path.filter_area = "14"
				@current_path.save
				redirect_to "/results"
			else
				redirect_to action: :question_6
			end

		end
	end




	def question_6

		unless request.post?
			@question = :question_6  #locale key to get question string
			@options = [:question_6_option_1, :question_6_option_2] #array of keys of options to get answers
			@info = :question_6_info #locale key to get info

			render "screening/question"

		else
			@current_path.question_6 = params["answer"]
			@current_path.save

			if params["answer"] == "question_6_option_1"

				@current_path.filter_area = "14,6"
				@current_path.save
				redirect_to "/results"
			else
				redirect_to action: :question_7
			end

		end
	end




	def question_7

		unless request.post?
			@question = :question_7  #locale key to get question string
			@options = [:question_7_option_1, :question_7_option_2] #array of keys of options to get answers
			@info = :question_7_info #locale key to get info

			render "screening/question"

		else
			@current_path.question_7 = params["answer"]
			@current_path.save

			if params["answer"] == "question_7_option_1"
				@current_path.filter_area = "14,15"
				@current_path.save
				redirect_to "/results"
			else
				redirect_to action: :question_8
			end

		end
	end


	

	def question_8

		unless request.post?
			@question = :question_8  #locale key to get question string
			@options = [:question_8_option_1, :question_8_option_2] #array of keys of options to get answers
			@info = :question_8_info #locale key to get info

			render "screening/question"

		else
			@current_path.question_8 = params["answer"]
			@current_path.save

			if params["answer"] == "question_8_option_1"
				@current_path.filter_area = "2"
				@current_path.save
				redirect_to "/results"
			else
				redirect_to action: :question_9
			end

		end
	end




	def question_9

		unless request.post?
			@question = :question_9  #locale key to get question string
			@options = [:question_9_option_1, :question_9_option_2] #array of keys of options to get answers
			@info = :question_9_info #locale key to get info

			render "screening/question"

		else
			@current_path.question_9 = params["answer"]
			@current_path.save

			if params["answer"] == "question_9_option_1"

				redirect_to action: :question_9_sub_1
			else
				redirect_to "/results"
			end

		end
	end


	def question_9_sub_1
		unless request.post?
			@question = :question_9_sub_1  #locale key to get question string
			@options = [:question_9_sub_1_option_1, :question_9_sub_1_option_2] #array of keys of options to get answers
			@info = :question_9_sub_1_info #locale key to get info

			render "screening/question"

		else
			@current_path.question_9_sub_1 = params["answer"]
			@current_path.save

			if params["answer"] == "question_9_sub_1_option_1"

				redirect_to action: :question_9_sub_1_sub_2
			else
				redirect_to "/results"
			end

		end
	end

	def question_9_sub_2
		unless request.post?
			@question = :question_9_sub_2  #locale key to get question string
			@options = [:question_9_sub_2_option_1, :question_9_sub_2_option_2] #array of keys of options to get answers
			@info = :question_9_sub_2_info #locale key to get info

			render "screening/question"

		else
			@current_path.question_9_sub_2 = params["answer"]
			@current_path.save

			if params["answer"] == "question_9_sub_2_option_1"

				redirect_to action: :question_9_sub_2_sub_3
			else
				redirect_to "/results"
			end

		end
	end

	def question_9_sub_3
		unless request.post?
			@question = :question_9_sub_3  #locale key to get question string
			@options = [:question_9_sub_3_option_1, :question_9_sub_3_option_2] #array of keys of options to get answers
			@info = :question_9_sub_3_info #locale key to get info

			render "screening/question"

		else
			@current_path.question_9_sub_3 = params["answer"]
			@current_path.save

			if params["answer"] == "question_9_sub_3_option_1"

				redirect_to action: :question_9_sub_3_sub_1
			else
				redirect_to "/results"
			end

		end
	end

	def question_9_sub_4
		unless request.post?
			@question = :question_9_sub_4  #locale key to get question string
			@options = [:question_9_sub_4_option_1, :question_9_sub_4_option_2] #array of keys of options to get answers
			@info = :question_9_sub_4_info #locale key to get info

			render "screening/question"

		else
			@current_path.question_9_sub_4 = params["answer"]
			@current_path.save

			if params["answer"] == "question_9_sub_4_option_1"

				redirect_to "/results"
			else
				@current_path.filter_area = "16"
				@current_path.save
				redirect_to "/results"
			end

		end
	end



end
