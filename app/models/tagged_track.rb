class TaggedTrack < ActiveRecord::Base
	belongs_to :track
	belongs_to :tag
end
