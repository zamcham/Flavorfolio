class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 50
      t.string :photo, null: false, default: 'defaultUser.jpg'

      t.timestamps
    end
  end
end
