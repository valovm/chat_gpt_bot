require "openai"
require 'telegram/bot'

OPENAI_API_KEY = ENV['OPENAI_API_KEY']
OPENAI_MODEL = ENV['OPENAI_MODEL']
TG_TOKEN = ENV['TG_TOKEN']
TG_ENV = ENV['TG_ENV']

@client = OpenAI::Client.new(access_token: OPENAI_API_KEY)

def handle_message(message:, user_id:)
  response = @client.chat(parameters: {
    model: OPENAI_MODEL,
    messages: [{ role: "user", content: message }],
    temperature: 0.7,
    user: user_id,
  })

  response.dig("choices", 0, "message", "content")
rescue
  'Oops something is wrong, please try later'
end

Telegram::Bot::Client.run(TG_TOKEN, environment: TG_ENV) do |bot|
  bot.listen do |message|
    bot.api.send_message(chat_id: message.chat.id, text:  handle_message(message: message.text, user_id: message.chat.id.to_s))
  end
end





