class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :project, foreign_key: true
      t.string :name
      t.boolean :done, default: false
      t.datetime :deadline #add in adminer

      t.timestamps
    end
  end
end
