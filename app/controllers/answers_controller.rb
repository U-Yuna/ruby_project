class AnswersController < ApplicationController
  # クイズセットの問題一覧を表示する画面（解答フォーム）


  def new
    @quiz_set = QuizSet.find(params[:id])
    @questions = @quiz_set.questions.includes(:choices)
  end

  # ユーザーの回答を受け取り、採点して結果を表示
  def create
    @quiz_set = QuizSet.find(params[:id])
    @questions = @quiz_set.questions.includes(:choices)

    @score = 0
    @results = []

    @questions.each do |question|
      selected_choice_id = params[:answers][question.id.to_s]
      correct = (question.correct_choice_id.to_s == selected_choice_id)
      @score += 1 if correct

    @results << {
      question: question,
      selected_choice_id: selected_choice_id,
      correct: correct
    }
  end

  # ユーザーの累積正解数を更新
  if current_user
    current_user.increment!(:correct_answers_count, @score)
  end
  end

  # クイズ解くための一覧ページ
  def list
    @quiz_sets = QuizSet.all.order(created_at: :desc)
  end
end
