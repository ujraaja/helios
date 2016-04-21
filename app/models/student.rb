class Student < ActiveRecord::Base
    require 'csv'
    def self.to_csv(all_products)
        CSV.generate do |csv|
            csv << column_names
            all_products.each do |product|
                csv << product.attributes.values_at(*column_names)
            end
        end
    end
end
