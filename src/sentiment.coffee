ReturnValue = require 'nanocyte-component-return-value'
sentiment = require 'sentiment'

class Sentiment extends ReturnValue
  onEnvelope: (envelope) =>
    { config } = envelope
    { value }  = config

    message = sentiment value
    message.text = value
    return message

module.exports = Sentiment
