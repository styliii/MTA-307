
desc 'send sms status'
task :send_sms_status => :environment do
   # import latest subway statuses
   # determine which subway lines aren't running TODAY
   # determine which users are associated to subway lines that aren't running
   # send twilio sms to those users

  bad_status = Status.where("created_at > ?", 5.day.ago).select{|status| status.status !~ /good/i}

  bad_status.each do |status|
    next if status.subway_line.nil?
    subway_line = status.subway_line
      subway_line.users.each do |user|
        # puts status.description.truncate(150).length
        TwilioClient.send_text_message(user.number, status.description.truncate(150)) if user.number
      end
    end
end



