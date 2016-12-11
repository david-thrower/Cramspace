Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :questions, except: [:show]
  get 'questions/quiz', to: 'questions#quiz', as: 'questions_quiz'
  patch 'questions/quiz/:id/selecta', to: 'questions#multiplea' , as: 'question_multiple_a'
  patch 'questions/quiz/:id/selectb', to: 'questions#multipleb', as: 'question_multiple_b'
  patch 'questions/quiz/:id/selectc', to: 'questions#multiplec', as: 'question_multiple_c'
  patch 'questions/quiz/:id/selectd', to: 'questions#multipled', as: 'question_multiple_d'
  patch 'questions/quiz/:id/selectt', to: 'questions#tft', as: 'question_tf_t'
  patch 'questions/quiz/:id/selectf', to: 'questions#tff', as: 'question_tf_f'
  get 'questions/grade', to: 'questions#grade', as: 'questions_grade'
  get 'questions/completed', to: 'questions#completed', as: 'questions_completed'
  patch 'completed/:id/move', to: 'questions#move', as: 'question_move'
  get 'questions/deleted', to: 'questions#deleted', as: 'questions_deleted'
  patch 'questions/deleted/:id/undelete', to: 'questions#undelete', as:  'question_undelete'
  patch 'questions/quiz/:id/selectfib', to: 'questions#question_fib', as: 'question_fib'
  end

