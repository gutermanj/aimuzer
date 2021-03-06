class Track < ActiveRecord::Base
	acts_as_votable
	belongs_to :user

	has_many :playlist_tracks

	has_many :playlists, through: :playlist_tracks

	has_many :tagged_tracks
	has_many :tags, through: :tagged_tracks

	mount_uploader :track, TrackUploader

	validates :title, presence: true
	validates :description, presence: true
	validates :track, presence: true
	validates_length_of :title, :minimum => 2, :too_short => "please enter at least %d character"
	validates_length_of :description, :minimum => 10, :too_short => "please enter at least %d characters"


	def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title || description like ?", "%#{query}%")
  	end
end
