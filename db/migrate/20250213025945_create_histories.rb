class CreateHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :histories do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :previous_status
      t.string :new_status

      t.timestamps
    end
  end
end
