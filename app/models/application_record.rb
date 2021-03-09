class ApplicationRecord < ActiveRecord::Base
  extend SimpleCalendar
  self.abstract_class = true
end
