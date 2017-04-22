class CreateComputerStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :computer_statuses do |t|
      t.integer :status
      t.jsonb :users
      t.references :computer, foreign_key: true

      t.timestamps
    end
  end
end
