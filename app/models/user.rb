class User
  include Mongoid::Document
  field :uni, type: String
  field :email, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :majors, type: String
  field :minors, type: String
  field :role, type: String, default: ->{'student'}
   #validates :email, uniqueness: true
  has_and_belongs_to_many :courses

  validates :email, presence: true


end
