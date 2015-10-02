ReturnValue = require 'nanocyte-component-return-value'
sentiment = require 'sentiment'

class SentimentNode extends ReturnValue
  onEnvelope: (envelope) =>
    { value } = envelope.config

    message = sentiment value
    message.text = value
    return message

module.exports = SentimentNode
