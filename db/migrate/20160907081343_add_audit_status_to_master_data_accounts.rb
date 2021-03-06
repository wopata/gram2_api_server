class AddAuditStatusToMasterDataAccounts < ActiveRecord::Migration
  def change
    add_column :gram_accounts, :audit_status, :integer, default: 0
    add_column :gram_accounts, :audit_comments, :string
    add_index :gram_accounts, :audit_status
  end
end
