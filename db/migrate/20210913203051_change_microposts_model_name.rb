class ChangeMicropostsModelName < ActiveRecord::Migration[6.1]
  def change
    rename_table :microposts, :posts
  end
end
