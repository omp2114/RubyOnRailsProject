class User
  include Mongoid::Document
  field :uni, type: String
  field :email, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :majors, type: String
  field :minors, type: String

  has_and_belongs_to_many :courses

end
