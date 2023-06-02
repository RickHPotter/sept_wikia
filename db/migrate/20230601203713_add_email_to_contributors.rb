class AddEmailToContributors < ActiveRecord::Migration[7.0]
  def change
    add_column :contributors, :email, :string
  end
end
