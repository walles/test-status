{View} = require 'atom'

module.exports =
class TestStatusView extends View
  @content: ->
    @div class: 'test-status-output overlay from-top', =>
      @div class: 'message', outlet: 'testStatusOutput'

  initialize: ->
    @output = "<strong>No output</strong>"
    @testStatusOutput.html(@output)

    atom.workspaceView.command "test-status:toggle-output", =>
      @toggle()

  update: (output) ->
    @output = output
    @testStatusOutput.html("<pre>#{@output.trim()}</pre>")

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this) if @output?
