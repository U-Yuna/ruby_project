class QuestionsController < ApplicationController
  before_action :set_quiz_set, only: [:new, :create, :edit, :update, :destroy]

  def new
    @question = @quiz_set.questions.build
    4.times { @question.choices.build }
  end

  # app/controllers/questions_controller.rb
def create
  @question = @quiz_set.questions.build(question_params)

  # 🔽 正解に選ばれたインデックスの選択肢を設定
  index = @question.correct_choice_index.to_i
  @question.correct_choice = @question.choices[index]

  if @question.save
    redirect_to @quiz_set, notice: "クイズが追加されました"
  else
    render :new, status: :unprocessable_entity
  end
end

def edit
  @quiz_set = QuizSet.find(params[:quiz_set_id])
  @question = Question.find(params[:id])
end

def update
  @question = Question.find(params[:id])

  index = question_params[:correct_choice_index].to_i
  @question.correct_choice = @question.choices[index]

  if @question.update(question_params.except(:correct_choice_index))
    @question.correct_choice_id = @question.correct_choice.id
    @question.save
    redirect_to quiz_set_path(@question.quiz_set), notice: "問題を更新しました"
  else
    render :edit
  end
end

def destroy
  @question = Question.find(params[:id])
  quiz_set = @question.quiz_set
  @question.destroy
  redirect_to quiz_set_path(quiz_set), notice: "問題を削除しました"
end


  private

  def set_quiz_set
    @quiz_set = QuizSet.find(params[:quiz_set_id])
  end

  def question_params
  params.require(:question).permit(
    :content,
    :correct_choice_index, # ラジオボタンで選ばれた index を受け取る
    choices_attributes: [:id, :content]
  )
end

end
