class Assignment
  include Mongoid::Document
  field :due_date, type: Date
  field :assign_date, type: Date
  field :description, type: String
  field :points_max, type: Integer
  field :points_earned, type: Float
  belongs_to :course
  embeds_one :upload
end
