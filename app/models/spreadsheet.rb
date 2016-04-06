class Spreadsheet < ActiveRecord::Base
    mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
    validates :name, presence: true # Make sure the owner's name is present.
    
    def saveAndMove
        saved = self.save 
        
        if saved
            system('find public/uploads/spreadsheet/attachment/ -type d > Folders.txt')
            line_num=1
            text=File.open('Folders.txt').read
            text.gsub!(/\r\n?/, "\n")
            text.each_line do |line|
                if line_num > 1 
                    line = line.gsub(/\n/,"")
                    puts 'mv ' + line +'/* public/uploads/spreadsheet/attachment/'
                    system('mv ' + line +'/* public/uploads/spreadsheet/attachment/')
                    system('rm ' + line +'/ -r')
                end
                line_num += 1
            end 
        end
        
        savedsaved = self.save 
        
        if saved
            
        end
        
        saved
        
    end
end
