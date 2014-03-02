TestStatusView = require './test-status-view'

module.exports =
  testStatusView: null

  activate: (state) ->
    @testStatusView = new TestStatusView(state.testStatusViewState)

  deactivate: ->
    @testStatusView.destroy()

  serialize: ->
    testStatusViewState: @testStatusView.serialize()
