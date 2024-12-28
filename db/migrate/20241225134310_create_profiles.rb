class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nickname, null: false
      t.integer :age
      t.integer :gender
      t.string :region
      t.text :introduction
      t.timestamps
    end
  end
end
