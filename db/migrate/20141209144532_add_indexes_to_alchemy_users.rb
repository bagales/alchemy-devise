# frozen_string_literal: true

class AddIndexesToAlchemyUsers < ActiveRecord::Migration[4.2]
  def up
    add_index :alchemy_users, :firstname
    add_index :alchemy_users, :lastname
  end

  def down
    remove_index :alchemy_users, :firstname
    remove_index :alchemy_users, :lastname
  end
end
