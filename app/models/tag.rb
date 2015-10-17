class Tag < ActiveRecord::Base
	has_and_belongs_to_many :vacancies
	has_and_belongs_to_many :internusrs
end
