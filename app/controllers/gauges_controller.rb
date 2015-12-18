class GaugesController < ApplicationController
	def index
		set_channels_menu
		@channel = Channel.find(params[:channel_id])
		@channel_id = params[:channel_id]
		@domain = domain
		#set default value of model gauge
		#here
		check_permissions(@channel)		
	end

	def show
		
	end
end
