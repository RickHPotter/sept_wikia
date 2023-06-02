class CreateContributors < ActiveRecord::Migration[7.0]
  def change
    create_table :contributors do |t|
      t.string :name
      t.string :role
      t.text :intro

      t.timestamps
    end
  end
end
