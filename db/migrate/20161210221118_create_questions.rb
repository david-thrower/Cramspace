class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.integer :questionformat
      t.boolean :tfcredited
      t.boolean :tfresponse
      t.integer :multiplecredited
      t.integer :multipleresponse
      t.string :fibcredited
      t.string :fibresponse
      t.boolean :correct
      t.integer :pointspossible
      t.integer :pointsearned
      t.boolean :deleted
      t.text :answercomment

      t.timestamps
    end
  end
end
