class QuestionController < ApplicationController
  def index
  	@question = Question.all
  end

  def show
  	@question = Question.find(params[:id])
  end

  def new
  	@question = Question.new
  end

  def create
    @question = question.new(params.require(:question).permit(:title, :body))
    raise
    if @question.save
      flash[:notice] = "Question was saved."
      redirect_to @question
    else
      flash[:error] = "There was an error saving the question. Please try again."
      render :new
    end
  end

  def resolved
  	check_box("question", "validated")
  	input name="question[validated]" type="hidden" value="0" 
 	input checked="checked" type="checkbox" id="question_validated" name="question[validated]" value="1"
 end



  def edit
  	@question = Question.find(params[:id])
  end
end
