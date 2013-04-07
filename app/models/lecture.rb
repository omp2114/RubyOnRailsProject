class Lecture
  include Mongoid::Document
  field :lecture_date, type: Date
  field :lecture_time, type: Time
  field :number, type: Integer
  field :title, type: String
  embedded_in :course
end
