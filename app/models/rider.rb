class Rider < ActiveRecord::Base
	require 'chronic_duration'
  attr_accessible :email, :name, :rider_number

  after_update :push_finish

  

  protected

  	def push_finish
  		push_event('rider_finish') #push event rider_finish action
  		push_event('leader_board') #push event
  	end

    def race_start_time
      Time.new(2013,5,12,11,30,0)
    end

  	



  	def push_event(event_type)
  		
      #ftime = ChronicDuration.output((self.finish_time).to_i, :format => :chrono)
  		Pusher["ride13-#{Rails.env}"].trigger(event_type,
  		{
  			:id => self.id.to_s,
  			:name => self.name,
  			:rider_number => self.rider_number,
  			:finish_time => self.finish_time.strftime("%l:%M:%S")
  		})
  	end



end
