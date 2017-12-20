class Article < ApplicationRecord
  # scope :by_title, -> {where("articles.title = ? and articles.title =  ?",'oooooo','oooooo') }
  scope :by_title, -> (title) { where('articles.title = ?', title) unless title.blank?}
  scope :by_text_not_blank, -> (text) { where('articles.text = ?', text) unless text.blank?}
  has_many :comments, dependent: :destroy
  # validates :title, presence: true,
  #           length: {minimum: 5}
end
