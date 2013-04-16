class Rider < ActiveRecord::Base
	require 'chronic_duration'
  attr_accessible :email, :name, :rider_number, :start_time

  before_create :set_start_time

  #after_update :push_finish



  

  protected

  	def push_finish
  		push_event('rider_finish') #push event rider_finish action
  		push_event('leader_board') #push event
  	end
#
    def race_start_time
      start_time = Time.new(2013,4,15,12,00,0)
      start_time + ((self.id - 1) * 30).seconds
    end

  	def push_event(event_type)
      ttime = ChronicDuration.output((self.finish_time - race_start_time).to_i)
  		ftime = ChronicDuration.output((self.finish_time - race_start_time).to_i, :format => :short)
      #ftime = ChronicDuration.output((self.finish_time).to_i, :format => :chrono)
  		Pusher["ride13-#{Rails.env}"].trigger(event_type,
  		{
  			:id => self.id.to_s,
  			:name => self.name,
  			:rider_number => self.rider_number,
  			:finish_time => ftime#finish_time.strftime("%l:%M:%S")
  		})
  	end

  private
  
    def set_start_time
      st = Time.new(2013,4,16,10,45,0)
      self.start_time = st + (Rider.count * 30).seconds
    end  

end
