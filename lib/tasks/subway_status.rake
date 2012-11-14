
desc 'send sms status'
task :send_sms_status => :environment do
   # import latest subway statuses
   # determine which subway lines aren't running TODAY
   # determine which users are associated to subway lines that aren't running
   # send twilio sms to those users

   bad_status = Status.where("created_at > ?", 1.day.ago).select{|status| status.status != "GOOD SERVICE"}
   affected_lines = bad_status.collect{|status| status.subway_line }.compact

   affected_lines.each do |subway_line|
    subway_line.users.each do |user|
      puts "sending sms to #{user.email}"
    end
  end

end
