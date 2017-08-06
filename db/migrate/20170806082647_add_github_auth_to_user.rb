class AddGithubAuthToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email, :string
    add_column :users, :username, :string
    add_column :users, :avatar_url, :string
    add_column :users, :uid, :integer
    add_column :users, :provider, :string
    add_column :users, :oauth_token, :string
  end
end
