class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers, id: :uuid do |t|
      t.belongs_to :question, null: false, foreign_key: true, type: :uuid
      t.text :body

      t.timestamps
    end
  end
end
