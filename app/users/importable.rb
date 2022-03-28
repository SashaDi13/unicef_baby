module Importable
  class ImportExel
    def initialize(file)
      @file = file
    end

    def import
      spreadsheet = Roo::Excelx.new(@file)

      (1..spreadsheet.last_row).each do |i|
        (0..5).each do |j|

          if spreadsheet.row(i)[j].nil?
            next
          end

          if j == 0
            parent_id = NIL
          else
            row = i

            while spreadsheet.row(row)[j - 1].nil? do
              row -= 1
            end

            parent_id = User.where(name: spreadsheet.row(row)[j -1]).last.id
          end

          User.create(name: spreadsheet.row(i)[j], parent_id: parent_id)
        end
      end
    end
  end
end
