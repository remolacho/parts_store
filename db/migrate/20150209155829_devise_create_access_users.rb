class DeviseCreateAccessUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|

      t.references :role
      t.string :firstname, limit: 50, null: false
      t.string :lastname, limit: 50, null: false
      t.string :usertag, limit: 50, null: false
      t.string :street_name, limit: 50, null: false
      t.string :street_num, limit: 50, null: false
      t.string :career_num, limit: 50, null: false
      t.string :home_num, limit: 50, null: false
      t.string :address, limit: 150, null: false
      t.string :mobile_phone, limit: 14, null: false
      t.string :home_phone, limit: 14

      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.integer :created_by, null: false, default: 0
      t.integer :updated_by, null: false, default: 0
      t.timestamps
    end

    add_index :users, :role_id
    add_index :users, :usertag,              unique: true
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :access_users, :confirmation_token,   unique: true
    # add_index :access_users, :unlock_token,         unique: true
  end
end
