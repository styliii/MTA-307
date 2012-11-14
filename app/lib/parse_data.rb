require 'nokogiri'
require 'open-uri'
require 'cgi'
require 'date'

xml_doc = Nokogiri::HTML(open("http://www.mta.info/status/serviceStatus.txt"))

good_lines = xml_doc.css('line').select { |line|
  line.css('status').text.downcase !~ /good/
}

good_lines.each do |line|
  # puts CGI.unescapeHTML(line.css('text').text)
  name = line.css('name')
  status = line.css('status')

  dt = "#{line.css('date').text} #{line.css('time').text}"

  puts dt

  # datetime =  DateTime.parse(dt) if dt
  # puts datetime
  description = Nokogiri::HTML(line.css('text').text).text
  # Status.create(:name => name, :status => status, :description => description)
end 

# name
# status
# text
# date
# time