class Student < ActiveRecord::Base
    require 'csv'
    def self.to_csv(all_products, selected_columns)
        
        puts "========================"
        puts selected_columns.inspect
        puts "========================"
        
        hasCount = selected_columns.find { |item| item =~ /count/i }
        selected_columns.reject!{|item| item =~ /count/i }
        
        CSV.generate do |csv|
            if hasCount
               csv << ["Count = " + all_products.length.to_s]
            end
            csv << selected_columns
            all_products.each do |product|
                csv << product.attributes.values_at(*selected_columns)
            end
        end
    end
end
