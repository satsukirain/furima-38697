class Article < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
end
