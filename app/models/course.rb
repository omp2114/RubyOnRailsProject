class Course
  include Mongoid::Document
  field :professor, type: String
  field :description, type: String
  field :callnumber, type: Integer
  field :enrollment, type: Integer
  field :days, type: String
  field :schedule, type: Time
  field :TA, type: String
  has_and_belongs_to_many  :user
  embeds_many :lecture
  has_many :assignment
end
