class Contributor < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, format: { with: /\A(.+)@(.+)\z/, message: 'is invalid' },
                    uniqueness: { case_sensitive: false },
                    length: { minimum: 5, maximum: 254 }
  validates :name, length: { minimum: 2 }
  validates :intro, length: { minimum: 4 }
  validates :role, presence: true
  before_save :name_fixer

  def day
    created_at.strftime('%b %e, %Y')
  end

  def name_fixer
    # ? add a case to capitalize after [&, -, /]
    self.name = name.split(/ |_/).map(&:capitalize).join(' ')
  end
end
