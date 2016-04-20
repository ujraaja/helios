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
        printData(data)  
        #createData(data)
        
        
      end
      
      
      if saved
         redirect_to site_index_path, notice: "The Spreadsheet #{@spreadsheet.name} has been uploaded."
      else
         redirect_to site_index_path, notice: "The Spreadsheet #{@spreadsheet.name} has not been uploaded."
      end
  end
  
  def createData(data)
    Datum.create({
          :uin => data[0],
          :t_number => data[1],
          :name => data[2],
          :email => data[3],
          :class => data[4],
          :first_tamu_term => data[5],
          :first_term_in_college => data[6],
          :prim_deg => data[7],
          :prim_deg_col => data[8],
          :prim_deg_cat => data[9],
          :prim_deg_maj_1 => data[10],
          :prim_deg_maj_1_dep => data[11],
          :prim_deg_maj_1_con_1 => data[12],
          :prim_deg_maj_1_con_2 => data[13],
          :prim_deg_maj_1_con_3 => data[14],
          :prim_deg_maj_2 => data[15],
          :prim_deg_maj_2_dep => data[16],
          :prim_deg_maj_2_con_1 => data[17],
          :prim_deg_maj_2_con_2 => data[18],
          :prim_deg_maj_2_con_3 => data[19],
          :prim_deg_min_1 => data[20],
          :prim_deg_min_2 => data[21],
          :sec_deg => data[22],
          :sec_deg_col => data[23],
          :sec_deg_cat => data[24],
          :sec_deg_maj_1 => data[25],
          :sec_deg_maj_1_dep => data[26],
          :sec_deg_maj_1_con_1 => data[27],
          :sec_deg_maj_1_con_2 => data[28],
          :sec_deg_maj_1_con_3 => data[29],
          :sec_deg_maj_2 => data[30],
          :sec_deg_maj_2_dep => data[31],
          :sec_deg_maj_2_con_1 => data[32],
          :sec_deg_maj_2_con_2 => data[33],
          :sec_deg_maj_2_con_3 => data[34],
          :sec_deg_min_1 => data[35],
          :sec_deg_min_2 => data[36],
          :deg_cand => data[37],
          :grad_term => data[38],
          :grad_status => data[39],
          :local_st_1 => data[40],
          :local_st_2 => data[41],
          :local_city => data[42],
          :local_state => data[43],
          :local_zip => data[44],
          :local_phone => data[45],
          :perm_st_1 => data[46],
          :perm_st_2 => data[47],
          :perm_city => data[48],
          :perm_state => data[49],
          :perm_zip => data[50],
          :perm_phone => data[51],
          :withdrawal_code => data[52],
          :term_attemp_hrs => data[53],
          :term_current_hrs => data[54],
          :term_earned_hrs => data[55],
          :term_passed_hrs => data[56],
          :term_gpa_hrs => data[57],
          :term_qual_pts => data[58],
          :term_gpa => data[59],
          :term_x_hrs => data[60],
          :term_i_hrs => data[61],
          :tamu_ov_attemp_hrs => data[62],
          :tamu_ov_earned_hrs => data[63],
          :tamu_ov_passed_hrs => data[64],
          :tamu_ov_gpa_hrs => data[65],
          :tamu_ov_qual_pts => data[66],
          :tamu_ov_gpa => data[67],
          :tamu_ov_variance => data[68],
          :term_variance => data[69],
          :tamu_honors_hrs => data[70],
          :ov_attemp_hrs => data[71],
          :ov_earned_hrs => data[72],
          :ov_passed_hrs => data[73],
          :trans_earned_hrs => data[74],
          :trans_passed_hrs => data[75],
          :tamu_grad_ov_gpa => data[76],
          :tamu_grad_deg_gpa => data[77],
          :tamu_grad_deg_plan => data[78],
          :law_attribute => data[79],
          :r_holds => data[80],
          :t_holds => data[81],
          :state_drops => data[82],
          :crs_w_q_grades => data[83],
          :hrs_w_q_grades => data[84],
          :crs_w_w_grades => data[85],
          :hrs_w_w_grades => data[86],
          :crs_w_i_grades => data[87],
          :hrs_w_i_grades => data[88],
          :crs_w_x_grades => data[89],
          :hrs_w_x_grades => data[90],
          :crs_w_fyge => data[91],
          :hrs_w_fyge => data[92],
          :regents_sch => data[93],
          :country_of_origin => data[94],
          :county_of_origin => data[95],
          :sex => data[96],
          :ethnicity => data[97],
          :first_generation => data[98],
          :residency => data[99],
          :date_of_birth => data[100],
          :visa => data[101],
          :citizen => data[102],
          :admit_type => data[103],
          :faid_offered => data[104],
          :faid_accepted => data[105],
          :high_school => data[106],
          :hs_class_size => data[107],
          :hs_class_rank => data[108],
          :hs_percentile => data[109],
          :sat_total => data[110],
          :sat_verbal_rdg => data[111],
          :sat_verbal_wtg => data[112],
          :sat_math => data[113],
          :act_composite => data[114],
          :act_english => data[115],
          :act_math => data[116],
          :act_science => data[117],
          :act_reading => data[118],
          :act_writing => data[119],
          :gre_total => data[120],
          :gre_verbal => data[121],
          :gre_quantitative => data[122],
          :gmat_total => data[123],
          :gmat_verbal => data[124],
          :gmat_quantitative => data[125],
          :lsat_average_index => data[126],
          :lsat_average_score => data[127],
          :lsat_highest_score => data[128],
          :lsat_highest_index => data[129],
          :toefl_total => data[130],
          :study_abrd_exp_current => data[131],
          :study_abrd_exp_ever => data[132],
          :special_program_1 => data[133],
          :special_program_2 => data[134],
          :dorm => data[135],
          :dorm_room => data[136],
          :prev_inst_deg_level_1 => data[137],
          :prev_institution_1 => data[138],
          :prev_inst_deg_date_1 => data[139],
          :prev_inst_deg_level_2 => data[140],
          :prev_institution_2 => data[141],
          :prev_inst_deg_date_2 => data[142],
          :prev_inst_deg_level_3 => data[143],
          :prev_institution_3 => data[144],
          :prev_inst_deg_date_3 => data[145],
          :prev_inst_deg_level_4 => data[146],
          :prev_institution_4 => data[147],
          :prev_inst_deg_date_4 => data[148],
          :prev_inst_deg_level_5 => data[149],
          :prev_institution_5 => data[150],
          :prev_inst_deg_date_5 => data[151],
          :advisor_name => data[152],
          :registered_term => data[153]
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
      #tableString = ":" + lowercase + " => data[" + i.to_s + "],"
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
