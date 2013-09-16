class Tag
  include Mongoid::Document

  field :text, type: String

  belongs_to :user

  has_and_belongs_to_many :notes

  validates_presence_of :text
end
