ReturnValue = require 'nanocyte-component-return-value'
Sentiment = require '../src/sentiment'

describe 'Sentiment', ->
  beforeEach ->
    @sut = new Sentiment

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an envelope', ->
      it 'should return the message', ->
        envelope =
          config:
            value: 'angry potato'

        message =
          score: -3
          comparative: -1.5
          tokens: [ 'angry', 'potato' ]
          words: [ 'angry' ]
          positive: []
          negative: [ 'angry' ]
          text: 'angry potato'

         expect(@sut.onEnvelope envelope).to.deep.equal message

    describe 'when called with a new envelope', ->
      it 'should return the new message', ->
        envelope =
          config:
            value: 'happy cats'

        message =
          score: 3
          comparative: 1.5
          tokens: [ 'happy', 'cats' ]
          words: [ 'happy' ]
          positive: [ 'happy' ]
          negative: []
          text: 'happy cats'

         expect(@sut.onEnvelope envelope).to.deep.equal message

    describe 'when called with a no message in the envelope', ->
      it 'should return the message', ->
        envelope =
          config:
            value: ''

        message =
          score: 0
          comparative: 0
          tokens: [""]
          words: []
          positive: []
          negative: []
          text: ''

         expect(@sut.onEnvelope envelope).to.deep.equal message
