require 'csv'

class CsvTransformer

  attr_accessor :pre_cleanup_csv_size

  def transform(file)
    csv = CSV.parse(file, headers: true,
                          header_converters: :symbol,
                          converters: lambda { |h| nil_converter(h) })

    @pre_cleanup_csv_size = csv.size

    csv.delete_if { |row| CsvRowCleaner.new(row).dirty_data? }

    csv.each { |row| CsvRowCleaner.new(row).transform_row }

    csv
  end

  def nil_converter(value)
    value == '\N' ? nil : value
  end

end
