TestStatusView = require './test-status-view'

module.exports =
  testStatusView: null

  activate: (state) ->
    @testStatusView = new TestStatusView

  deactivate: ->
    @testStatusView.destroy()
