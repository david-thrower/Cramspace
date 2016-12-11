class Question < ApplicationRecord
    validates :title, presence: { message: "A title is required." }
    validates :body, presence: {message: "Please enter your question in the body field" }
    validates :pointspossible, inclusion: { in: 1..20 }
    
    if :questionformat == 1
        validates :tfcredited, presence: { message: "For true or false questions, a true or false correct answer is required." }  
    elsif :questionformat == 2
        validates :multiplecredited, presence: { message: "For multiple choice questions, an multiple choice correct answer is required." }
    elsif :questionformat == 3
        validates :fibcredited, presence: { message: "For fill in the blank questions, a fill in the blank correct answer is required. " }
    end
    
end

