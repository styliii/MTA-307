class TwilioClient
  @twilio_client = Twilio::REST::Client.new(Rails.application.config.twilio_sid, Rails.application.config.twilio_token)

  def self.phone_number
    Rails.application.config.twilio_phone_number
  end

  def self.send_text_message(number_to_send_to, description)

    @twilio_client.account.sms.messages.create(
      :from => "+1#{phone_number}",
      :to => number_to_send_to,
      :body => "#{description}"
    )
  end
end
