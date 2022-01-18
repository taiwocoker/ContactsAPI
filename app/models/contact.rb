class Contact < ApplicationRecord
  has_paper_trail
  validates :email, :uniqueness => { :case_sensitive => false }
end
