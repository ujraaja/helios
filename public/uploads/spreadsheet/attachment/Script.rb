system('find public/uploads/spreadsheet/attachment/ -type d > Folders.txt')
line_num=1
text=File.open('Folders.txt').read
text.gsub!(/\r\n?/, "\n")
text.each_line do |line|
    if line_num > 1 
        #number = line.gsub(/.\//,"").gsub(/\n/,"")
        line = line.gsub(/\n/,"")
        puts 'mv ' + line +'/* public/uploads/spreadsheet/attachment/'
        system('mv ' + line +'/* public/uploads/spreadsheet/attachment/')
        system('rm ' + line +'/ -r')
        #puts number
        #system('mv public/uploads/spreadsheet/attachment/' + number +'/* public/uploads/spreadsheet/attachment/')
        #system('rm public/uploads/spreadsheet/attachment/' + number +'/ -r')
        #system('mv ' + number +'/* .')
        #system('rm ' + number +'/ -r')
    end
    line_num += 1
end