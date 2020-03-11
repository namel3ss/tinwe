# frozen_string_literal: true

require 'sqlite3'

module Tinwe
  # The command line user interface. It opens the catalog and
  # displays statistical data based on the options proveded.
  class Command
    def self.execute(args)
      db = SQLite3::Database.new args.first
      db.execute <<-SQL
        SELECT name
        FROM sqlite_master
        WHERE type ='table' AND
          name NOT LIKE 'sqlite_%';
      SQL
    end
  end
end
