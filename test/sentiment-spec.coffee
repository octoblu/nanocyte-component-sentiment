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
         expect(@sut.onEnvelope({message: 'angry potato'})).to.deep.equal { score: -3,comparative: -1.5,tokens: [ 'angry', 'potato' ],words: [ 'angry' ],positive: [],negative: [ 'angry' ],text: 'angry potato' }
