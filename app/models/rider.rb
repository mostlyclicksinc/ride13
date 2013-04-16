class Rider < ActiveRecord::Base
	require 'chronic_duration'
  attr_accessible :email, :name, :rider_number, :start_time

  before_create :set_start_time

  after_update :push_finish



  

  protected

  	def push_finish
  		push_event('rider_finish') #push event rider_finish action
  		push_event('leader_board') #push event
  	end

    

  	def push_event(event_type)
      ftime = ChronicDuration.output((self.finish_time).to_i)
  		rtime = ChronicDuration.output((calculate_finish_time), :format => :short)
      #ftime = ChronicDuration.output((self.finish_time).to_i, :format => :chrono)
  		Pusher["ride13-#{Rails.env}"].trigger(event_type,
  		{
  			:id => self.id.to_s,
  			:name => self.name,
  			:rider_number => self.rider_number,
  			:finish_time => rtime
  		})
  	end

  private
  
    def set_start_time
      st = Time.new(2013,4,16,10,45,0)
      self.start_time = st + (Rider.count * 30).seconds
    end

    def calculate_finish_time
      (self.finish_time - self.start_time).to_i
    end



end
