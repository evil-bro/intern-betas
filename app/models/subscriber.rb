class Subscriber < ActiveRecord::Base
	validates :subscriber_name, :presence => true
	validates :subscriber_email, :presence => true, :uniqueness => true
	validates_format_of :subscriber_email, :with => /@/

end
