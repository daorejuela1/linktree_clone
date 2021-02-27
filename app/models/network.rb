class Network < ApplicationRecord
  belongs_to :user
  before_save :create_and_update_name
  before_update :create_and_update_name

  def create_and_update_name
    self.name = String(self.link.match("(?!(\/{2}|www\.))[a-z]*(\.com)")).capitalize
  end
end
