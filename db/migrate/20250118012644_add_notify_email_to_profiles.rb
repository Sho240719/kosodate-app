class AddNotifyEmailToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :notify_email, :boolean, default: true, null: false
  end
end
