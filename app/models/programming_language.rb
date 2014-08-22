class ProgrammingLanguage < ActiveRecord::Base
  has_many :user_programming_languages
  has_many :users, through: :user_programming_languages
end
