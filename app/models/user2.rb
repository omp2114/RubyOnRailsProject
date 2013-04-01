class User2
	include Mongoid::Document
	field :first_name, type: String
	field :uni, type: String
	field :email, type: String
end