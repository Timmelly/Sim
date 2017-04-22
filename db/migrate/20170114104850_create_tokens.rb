class CreateTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :tokens do |t|
      t.string :token
      t.date :date_end
      t.string :api_action

      t.timestamps
    end
  end
end
