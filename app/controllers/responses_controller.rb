class ResponsesController < ApplicationController

def new
  if params[:answer_id]
    @responsible = "Answer"
    @responded_id = params[:answer_id]
    @response = Response.new
    @answer = Answer.find(params[:answer_id])
    @path = [@answer.question, @answer,  @response]
 else
    @responsible = "Question"
    @responded_id = params[:question_id]
    @answer = Answer.find(@responded_id)
    @response = Response.new
    @path = [Question.find(@responded_id), @response]
    end
end

def create
  @response = Response.new(response_params)
  @response.update(responsible_type: params[:responsible_type], responsible_id: params[:responsible_id])
 if @response.save
    flash[:notice] = "Your response was posted!"
    if @response.responsible == Question.find(@response.responsible.id)
    redirect_to @response.responsible
  else
    redirect_to @response.responsible.question
  end
 else
    flash.now[:notice] = "Your response was not posted correct."
    render "responses/new"
 end
end

private
  def response_params
    params.require(:response).permit(:responsible_type, :responsible_id, :content).merge(user_id: current_user.id)
  end
end




