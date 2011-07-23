class FeatureRequest < ActiveRecord::Base

  scope :recently_implemented, where('date_implemented IS NOT NULL AND date_implemented >= ?', Date.today-7.days)

end
