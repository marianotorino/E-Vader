class Contact < ActiveRecord::Base
  belongs_to :client
  validates :kind, :data, :client, presence: true
end
