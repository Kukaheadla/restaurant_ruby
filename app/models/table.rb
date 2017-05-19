class Table < ApplicationRecord
  has_and_belongs_to_many :dishes
end
