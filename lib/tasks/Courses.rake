namespace :Assignment4 do 
	task :coursefill => :environment do
		puts "Starting to read in the csv"
		require 'csv'
		source = Rails.root.join("courses.csv")
		parsed_csv = CSV.read(source);
		
		parsed_csv.each_with_index do |row, index|
			next if index == 0
			callnumber = row[0]
			name = row[1]
			start_time = row[2]
			end_time = row[3]
			days = row[4]
			building = row[5]
			room = row[6]
			professor = row[7]
			Course.create(:professor => professor, :name => name, :callnumber => callnumber, :days => days, 
				:schedule => start_time, :schedule_end => end_time, :room => room, :building => building)
		end

	end 
end