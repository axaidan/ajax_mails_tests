require 'faker'

class EmailsController < ApplicationController
	def index
		@emails = Email.all
	end

	def show
		puts params
		@email = Email.find(params[:id])
		respond_to do |format|
			format.html { redirect_to email_path(@email.id) }
			format.js { }
		end
	end

	def create
		@email = Email.new
		@email.object = Faker::Book.title
		@email.body = Faker::Lorem.word
		@email.save
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js { }
		end
	end

	def destroy
		puts params
		@email = Email.find(params[:id])
		@email.destroy
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js { }
		end
	end
end
