class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    find_this_question
    @answers = @question.answers
    @answer = Answer.new
    @vote = Vote.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Your question was posted!"
      redirect_to @question
    else
      flash.now[:notice] = "Your question was not posted correct."
      # @question = Question.new
      render "questions/new"
    end
  end

  def edit
    find_this_question
  end

  def update
    find_this_question
    @question.assign_attributes(question_params)
    if @question.save
      flash[:notice] = "Your question was successfully updated."
      redirect_to @question
    else
      flash.now[:notice] = "Your question could not be updated."
      render "questions/edit"
    end
  end

  def destroy
    find_this_question
    @question.destroy
    flash[:notice] = "Your question was deleted."
    redirect_to questions_path
  end


  private

  def find_this_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content).merge(user_id: current_user.id)
  end
end

