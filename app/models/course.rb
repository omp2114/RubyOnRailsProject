class Course
  include Mongoid::Document
  field :professor, type: String
  field :name, type: String
  field :description, type: String
  field :callnumber, type: Integer
  field :enrollment, type: Integer
  field :days, type: String
  field :schedule, type: Time
  field :schedule_end, type: Time
  field :TA, type: String
  field :room, type: Integer
  field :building, type: String
  
  has_and_belongs_to_many  :users
  embeds_many :lectures
  has_many :assignments

  validates :name, presence: true

end
