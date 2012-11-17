require 'open-uri'

desc 'import_status'
task :import_status => :environment do

last_status_date = Status.order(:posted_date).last.posted_date unless Status.count ==0

xml_doc = Nokogiri::HTML(open("http://www.mta.info/status/serviceStatus.txt"))
  good_lines = xml_doc.css('line')

  good_lines.each do |line|
    name = line.css('name').text
    status = line.css('status').text

    date = "#{line.css('date').text} #{line.css('time').text}"

    date.blank? ? parsed_time = nil : parsed_time ||= DateTime.strptime(date, '%m/%d/%Y %H:%M%p')

    # skip if this is an old status
    next if (parsed_time.nil? || parsed_time <= last_status_date)
    puts "#{name}, #{parsed_time}"

    description = Nokogiri::HTML(line.css('text').text).text
    new_status = Status.create(:name => name,
                        :status => status,
                        :description => description,
                        :posted_date => parsed_time)
    new_status.subway_line_id = SubwayLine.find_by_name(new_status.name).id if SubwayLine.find_by_name(new_status.name)
    new_status.save
  end
end
