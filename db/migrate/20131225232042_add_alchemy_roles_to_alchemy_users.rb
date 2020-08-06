# frozen_string_literal: true

class AddAlchemyRolesToAlchemyUsers < ActiveRecord::Migration[4.2]
  def up
    # Updating old :roles column (since Alchemy CMS v2.6)
    if column_exists?(:alchemy_users, :roles)
      rename_column :alchemy_users, :roles, :alchemy_roles
      change_column :alchemy_users, :alchemy_roles, :string, default: 'member'
    end

    # Creating :alchemy_roles column for new apps.
    unless column_exists?(:alchemy_users, :alchemy_roles)
      add_column :alchemy_users, :alchemy_roles, :string, default: 'member'
    end

    # Renaming the index
    remove_index :alchemy_users, :roles if index_exists?(:alchemy_users, :roles)
    add_index :alchemy_users, :alchemy_roles unless index_exists?(:alchemy_users, :alchemy_roles)
  end
end
