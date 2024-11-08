class Group < ApplicationRecord

  belongs_to :owner, class_name: 'User'
  # has_many :group_users, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true, length: { maximum: 100 }

  def is_owned_by?(user)
    owner.id == user.id
  end

end
