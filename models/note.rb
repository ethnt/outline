class Note
  include Mongoid::Document
  include Mongoid::Timestamps

  include Canable::Ables

  field :title, type: String
  field :text,  type: String

  validates_presence_of :title

  belongs_to :user

  def viewable_by?(u)
    self.user == u
  end

  def updatable_by?(u)
    self.viewable_by?(u)
  end

  def destroyable_by?(u)
    self.viewable_by?(u)
  end
end
