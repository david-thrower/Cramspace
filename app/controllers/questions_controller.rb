class QuestionsController < ApplicationController
    def index
        @questions = Question.where("deleted != ? AND correct =?", true, false) # in case there is a nil value in the 'deleted' column, this is why the deleted isn's WHERE deleted = false
    end
    def new
        @question = Question.new
    end
    def create
    @question = Question.new(question_create_params)  
    @question.deleted = false 
    @question.correct = false 
        if @question.save 
            redirect_to questions_path
        else
            render 'new'
        end
    end
    def edit
        @question = Question.find(params[:id])    
    end
    def update
         @question = Question.find(params[:id])  
            pointsearned = 0
        if @question.update(question_create_params) 
            redirect_to questions_path
        else
            render 'edit'
        end
    end
    def destroy
        @question = Question.find(params[:id])
        @question.deleted = true
        @question.save 
        redirect_to questions_path
    end
    def quiz
        @questions = Question.where("deleted != ? and correct = ?", true, false)  
    end
    def multiplea
        @question = Question.find(params[:id])
        @question.multipleresponse = 1
        @question.save
        redirect_to questions_quiz_path
    end
    def multipleb
        @question = Question.find(params[:id])
        @question.multipleresponse = 2
        @question.save
        redirect_to questions_quiz_path
    end
    def multiplec
        @question = Question.find(params[:id])
        @question.multipleresponse = 3 
        @question.save
        redirect_to questions_quiz_path
    end
    def multipled
        @question = Question.find(params[:id])
        @question.multipleresponse = 4 
        @question.save
        redirect_to questions_quiz_path
    end
    def tft
        @question = Question.find(params[:id])
        @question.tfresponse = true 
        @question.save
        redirect_to questions_quiz_path
    end
    def tff
        @question = Question.find(params[:id])
        @question.tfresponse = false 
        @question.save
        redirect_to questions_quiz_path
    end   
    def grade
        @questions = Question.all
    end
    def completed
        @questions = Question.where("correct = ?", true)
    end
    def move
        @question = Question.find(params[:id])
        @question.correct = false
        @question.save
        redirect_to questions_completed_path
    end
    def deleted
        @questions = Question.where("deleted = ?", true)
    end
    def undelete
        @question = Question.find(params[:id])
        @question.deleted = false
        @question.save
        redirect_to questions_deleted_path
        
        
    end
    
    def dupeindex
        @questions = Question.where("deleted != ? AND correct =?", true, false)
    end
    def question_fib
        @question = Question.find(params[:id])  
        @question.update(question_create_params) 
        redirect_to questions_quiz_path
    end 
    
private
def question_create_params
    params.require(:question).permit(:title, :body, :questionformat, :tfcredited, :multiplecredited, :fibcredited, :fibresponse, :pointspossible, :pointsearned, :deleted, :answercomment)   
end
end
