class AddUserIdToComments < ActiveRecord::Migration[7.0]
  def change
    # user_id カラムがすでに存在する場合は追加しない
    unless column_exists?(:comments, :user_id)
      add_reference :comments, :user, null: false, foreign_key: true
    end
  end
end
