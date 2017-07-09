class Post < ActiveRecord::Base


  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
  before_validation :clickbait?


  def clickbait?
    check = false
    if self.title
      clickbait_titles = ["Won't Believe", "Secret", "Top [number]", "Guess"]
      clickbait_titles.map do |title|
        if self.title.include?(title)
          check = true
        end
      end
    end
    check
  end

end





def clickbait?(title)
  check = false
  if title
    clickbait_titles = ["Won't Believe", "Secret", "Top [number]", "Guess"]
      clickbait_titles.each do |t|
      if title.include?(t)
      check = true
    end
  end
end
check
end
