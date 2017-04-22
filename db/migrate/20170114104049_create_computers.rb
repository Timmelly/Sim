class CreateComputers < ActiveRecord::Migration[5.0]
  def change
    create_table :computers do |t|
      t.string :ip
      t.string :mac
      t.string :name

      t.timestamps
    end
  end
end
