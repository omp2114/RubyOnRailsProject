class Upload
  include Mongoid::Document
  field :subject, type: String
  field :body, type: String
  field :file, type: String
  embedded_in :assignment
end
