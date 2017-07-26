class FeedbacksController < ApplicationController

	def index
		@feedback = Feedback.all.order("created_at DESC")
		@user = current_user
	end

	def create
		@feedback = Feedback.new(feedback_params)
		if @feedback.save
			UserMailer.feedback_email(@feedback).deliver_now #delay
			redirect_to root_path
			flash[:notice] = "Merci pour vos conseils !"
		else
			redirect_to root_path
			flash[:error] = "Une erreur s'est produite lors de l'envoi du message"
		end
	end

	def destroy
		@feedback = Feedback.find(params[:id])
		@feedback.destroy
		redirect_to feedbacks_path
	end

	private

	def feedback_params
		params.require(:feedback).permit(:message, :user_id)
	end

end
