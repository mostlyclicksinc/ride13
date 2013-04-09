class Rider < ActiveRecord::Base
	require 'chronic_duration'
  attr_accessible :email, :name
end
