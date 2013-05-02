class FixColumnName < ActiveRecord::Migration
 def change
    rename_column :courses, :type, :typeof
  end
end

