require 'csv'

class SpreadsheetsController < ApplicationController
  def index
    redirect_to site_studentOutput_path
  end

  def new
    redirect_to site_studentOutput_path
  end

  def create
    
      @spreadsheet = Spreadsheet.new(spreadsheet_params)
      
      ###### call parse_csv with the path to csv file
      
      saved = @spreadsheet.saveAndMove
      
      params["spreadsheet"].keys.each do |key|
        puts key.inspect
        puts params["spreadsheet"][key].inspect
      end
      
      location = "public/uploads/spreadsheet/attachment/" + params["spreadsheet"]["attachment"].original_filename
      command = "cat " + location
      system(command)
      
      #parse_csv(location)
      csv_data = CSV.read location
      puts csv_data.inspect
      csv_data.each do |data|
        #printData(data)  
        createStudent(data)
        
        
      end
      
      
      if saved
         redirect_to site_index_path, notice: "The Spreadsheet #{@spreadsheet.name} has been uploaded."
      else
         redirect_to site_index_path, notice: "The Spreadsheet #{@spreadsheet.name} has not been uploaded."
      end
  end
  
  def createStudent(student)
    Student.create({
          :uin => student[0],
          :t_number => student[1],
          :name => student[2],
          :email => student[3],
          :classification => student[4],
          :first_tamu_term => student[5],
          :first_term_in_college => student[6],
          :prim_deg => student[7],
          :prim_deg_col => student[8],
          :prim_deg_cat => student[9],
          :prim_deg_maj_1 => student[10],
          :prim_deg_maj_1_dep => student[11],
          :prim_deg_maj_1_con_1 => student[12],
          :prim_deg_maj_1_con_2 => student[13],
          :prim_deg_maj_1_con_3 => student[14],
          :prim_deg_maj_2 => student[15],
          :prim_deg_maj_2_dep => student[16],
          :prim_deg_maj_2_con_1 => student[17],
          :prim_deg_maj_2_con_2 => student[18],
          :prim_deg_maj_2_con_3 => student[19],
          :prim_deg_min_1 => student[20],
          :prim_deg_min_2 => student[21],
          :sec_deg => student[22],
          :sec_deg_col => student[23],
          :sec_deg_cat => student[24],
          :sec_deg_maj_1 => student[25],
          :sec_deg_maj_1_dep => student[26],
          :sec_deg_maj_1_con_1 => student[27],
          :sec_deg_maj_1_con_2 => student[28],
          :sec_deg_maj_1_con_3 => student[29],
          :sec_deg_maj_2 => student[30],
          :sec_deg_maj_2_dep => student[31],
          :sec_deg_maj_2_con_1 => student[32],
          :sec_deg_maj_2_con_2 => student[33],
          :sec_deg_maj_2_con_3 => student[34],
          :sec_deg_min_1 => student[35],
          :sec_deg_min_2 => student[36],
          :deg_cand => student[37],
          :grad_term => student[38],
          :grad_status => student[39],
          :local_st_1 => student[40],
          :local_st_2 => student[41],
          :local_city => student[42],
          :local_state => student[43],
          :local_zip => student[44],
          :local_phone => student[45],
          :perm_st_1 => student[46],
          :perm_st_2 => student[47],
          :perm_city => student[48],
          :perm_state => student[49],
          :perm_zip => student[50],
          :perm_phone => student[51],
          :withdrawal_code => student[52],
          :term_attemp_hrs => student[53],
          :term_current_hrs => student[54],
          :term_earned_hrs => student[55],
          :term_passed_hrs => student[56],
          :term_gpa_hrs => student[57],
          :term_qual_pts => student[58],
          :term_gpa => student[59],
          :term_x_hrs => student[60],
          :term_i_hrs => student[61],
          :tamu_ov_attemp_hrs => student[62],
          :tamu_ov_earned_hrs => student[63],
          :tamu_ov_passed_hrs => student[64],
          :tamu_ov_gpa_hrs => student[65],
          :tamu_ov_qual_pts => student[66],
          :tamu_ov_gpa => student[67],
          :tamu_ov_variance => student[68],
          :term_variance => student[69],
          :tamu_honors_hrs => student[70],
          :ov_attemp_hrs => student[71],
          :ov_earned_hrs => student[72],
          :ov_passed_hrs => student[73],
          :trans_earned_hrs => student[74],
          :trans_passed_hrs => student[75],
          :tamu_grad_ov_gpa => student[76],
          :tamu_grad_deg_gpa => student[77],
          :tamu_grad_deg_plan => student[78],
          :law_attribute => student[79],
          :r_holds => student[80],
          :t_holds => student[81],
          :state_drops => student[82],
          :crs_w_q_grades => student[83],
          :hrs_w_q_grades => student[84],
          :crs_w_w_grades => student[85],
          :hrs_w_w_grades => student[86],
          :crs_w_i_grades => student[87],
          :hrs_w_i_grades => student[88],
          :crs_w_x_grades => student[89],
          :hrs_w_x_grades => student[90],
          :crs_w_fyge => student[91],
          :hrs_w_fyge => student[92],
          :regents_sch => student[93],
          :country_of_origin => student[94],
          :county_of_origin => student[95],
          :sex => student[96],
          :ethnicity => student[97],
          :first_generation => student[98],
          :residency => student[99],
          :date_of_birth => student[100],
          :visa => student[101],
          :citizen => student[102],
          :admit_type => student[103],
          :faid_offered => student[104],
          :faid_accepted => student[105],
          :high_school => student[106],
          :hs_class_size => student[107],
          :hs_class_rank => student[108],
          :hs_percentile => student[109],
          :sat_total => student[110],
          :sat_verbal_rdg => student[111],
          :sat_verbal_wtg => student[112],
          :sat_math => student[113],
          :act_composite => student[114],
          :act_english => student[115],
          :act_math => student[116],
          :act_science => student[117],
          :act_reading => student[118],
          :act_writing => student[119],
          :gre_total => student[120],
          :gre_verbal => student[121],
          :gre_quantitative => student[122],
          :gmat_total => student[123],
          :gmat_verbal => student[124],
          :gmat_quantitative => student[125],
          :lsat_average_index => student[126],
          :lsat_average_score => student[127],
          :lsat_highest_score => student[128],
          :lsat_highest_index => student[129],
          :toefl_total => student[130],
          :study_abrd_exp_current => student[131],
          :study_abrd_exp_ever => student[132],
          :special_program_1 => student[133],
          :special_program_2 => student[134],
          :dorm => student[135],
          :dorm_room => student[136],
          :prev_inst_deg_level_1 => student[137],
          :prev_institution_1 => student[138],
          :prev_inst_deg_date_1 => student[139],
          :prev_inst_deg_level_2 => student[140],
          :prev_institution_2 => student[141],
          :prev_inst_deg_date_2 => student[142],
          :prev_inst_deg_level_3 => student[143],
          :prev_institution_3 => student[144],
          :prev_inst_deg_date_3 => student[145],
          :prev_inst_deg_level_4 => student[146],
          :prev_institution_4 => student[147],
          :prev_inst_deg_date_4 => student[148],
          :prev_inst_deg_level_5 => student[149],
          :prev_institution_5 => student[150],
          :prev_inst_deg_date_5 => student[151],
          :advisor_name => student[152],
          :registered_term => student[153]
        })
  end
  
  def printData(data)
    i = 0
    modelString = "rails g model student"
    data.each do |header|
      if header.gsub(' ', '_')
        header.gsub!(' ', '_')
      end
      if header.gsub('(', '')
        header.gsub!('(', '')
      end
      if header.gsub(')', '')
        header.gsub!(')', '')
      end
      if header.gsub('/', '')
        header.gsub!('/', '')
      end
      if header.gsub('-', '_')
        header.gsub!('-', '_')
      end
      lowercase = header.to_s.downcase
      #tableString = "t.string :" + lowercase
      #tableString = ":" + lowercase + " => student[" + i.to_s + "],"
      i = i + 1
      #puts tableString
      modelString = modelString + " " + lowercase + ":string"
    end
    puts modelString
  end

  def destroy
    redirect_to site_studentOutput_path
  end
  
  private
      def spreadsheet_params
        params.require(:spreadsheet).permit(:name, :attachment)
      end
      
      def create_db_schema(tableName, attrs, datatypes)    #attrs -> array of attributes as strings
        tableName = tableName.underscore.camelize
        tableName = "Data" + tableName
        attributes = ""
        ind = 0
        attrs.each do |attr|
          attributes << attr
          attributes << ":"
          attributes << datatypes[ind]
          attributes << " "
          ind = ind + 1
        end
        `rails generate model #{tableName} #{attributes}`
        `rake db:migrate`
      end
      
      def isInt(value)
        value == value.to_i.to_s
      end
      
      def determine_db_datatypes(csv_data, headers)
        datatypes = []
        headers.each do |header|
          datatypes << "integer"
        end
        csv_data.map do |row| 
            ind = 0
            row.map do |cell|
                if datatypes[ind] == "integer"
                  if !isInt(cell.to_s)
                    datatypes[ind] = "string"
                  end
                  ind = ind+1
                end
            end
        end
        return datatypes
      end
      
      def parse_csv(csvFile)
        csv_data = CSV.read csvFile
        headers = csv_data.shift
        tableNameStartIndex = csvFile.rindex('/') + 1
        tableName = csvFile[tableNameStartIndex..csvFile.length-5]
        datatypes = determine_db_datatypes(csv_data, headers)
        create_db_schema(tableName, headers, datatypes)
      end
end
