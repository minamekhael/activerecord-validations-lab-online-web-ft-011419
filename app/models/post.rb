class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :title, presence:true
  validates :content, length: {minimum: 150}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction), message: "%w(value) is not valid"}
  validate :clickbait?

   PHRASE = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/
  ]

    def clickbait?
    if PHRASE.none? {|c| c.match title}
      errors.add(:title, "must be clickbait")
    end
  end
end
