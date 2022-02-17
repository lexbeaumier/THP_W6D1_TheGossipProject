class CreateUtilisateurs < ActiveRecord::Migration[5.2]
  def change
    create_table :utilisateurs do |t|
      t.string :username
      t.string :email
      t.boolean :confirmed, default: false
      t.string :confirmation_token
      t.string :password_digest
      t.string :firstname
      t.string :lastname
      t.boolean :avatar, default: false

      t.timestamps
    end
  end
end
