class Rider < ActiveRecord::Base
	require 'chronic_duration'
  attr_accessible :email, :last_name, :rider_number, :start_time, :first_name, 
                  :chip_id, :official_start_time, :rider_gender, :club_team, :rider_cat,
                  :rider_class, :race_entered, :road_cat, :license

  before_create :set_start_time

  after_update :push_finish


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Rider.create! row.to_hash
    end
  end

  Rider.where(:finish_time != nil?)



  

  protected

  	def push_finish
  		push_event('rider_finish') #push event rider_finish action
  		push_event('leader_board') #push event
  	end

    

  	def push_event(event_type)
      
      #ftime = ChronicDuration.output(((self.finish_time).to_i), :format => :short)
  		rtime = ChronicDuration.output((calculate_ride_time), :format => :short)
      #ftime = ChronicDuration.output((self.finish_time).to_i, :format => :chrono)
  		Pusher["ride13-#{Rails.env}"].trigger(event_type,
  		{
  			:id => self.id.to_s,
  			:last_name => self.last_name,
        :first_name => self.first_name,
  			:rider_number => self.rider_number,
  			:finish_time => self.finish_time,
        :ride_time => rtime
  		})
  	end

  private
  
    def set_start_time
      st = Time.new(2013,5,2,12,30,0, "-05:00")
      self.start_time = st + (Rider.count * 30).seconds
    end

    def calculate_ride_time
      rt = (self.finish_time - self.start_time).to_i
      self.ride_time = rt
    end

    def format_finish_time
      fft = (self.finish_time).to_i
      self.finish_time = fft
    end



end
