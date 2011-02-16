class AddDesistiuToCrianca < ActiveRecord::Migration
  def self.up
    add_column :criancas, :desistiu, :boolean, :default => 0
  end

  def self.down
    remove_column :criancas, :desistiu
  end
end
