class CreateLastSystemChangings < ActiveRecord::Migration[5.0]
  def change
    create_table :last_system_changings do |t|
      t.datetime :changing_date

      t.timestamps
    end
  end
end
