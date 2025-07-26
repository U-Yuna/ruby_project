class QuizSetsController < ApplicationController
  def index
    @quiz_sets = QuizSet.all.order(created_at: :desc)
  end

  def new
    @quiz_set = QuizSet.new
  end

  def create
    @quiz_set = QuizSet.new(quiz_set_params)
    if @quiz_set.save
      redirect_to @quiz_set  # 作成後に表示ページへ
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @quiz_set = QuizSet.find(params[:id])
    @questions = @quiz_set.questions.includes(:choices)
  end

  def destroy
  @quiz_set = QuizSet.find(params[:id])
  @quiz_set.destroy
  redirect_to quiz_sets_path, notice: "クイズセットを削除しました。"
end


  private

  def quiz_set_params
    params.require(:quiz_set).permit(:title)
  end

end