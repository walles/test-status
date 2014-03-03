{View} = require 'atom'

module.exports =
class TestStatusView extends View
  @content: ->
    @div tabIndex: -1, class: 'test-status-output tool-panel panel-bottom padded', =>
      @div class: 'block', =>
        @div class: 'message', outlet: 'testStatusOutput'

  initialize: ->
    @output = "<strong>No output</strong>"
    @testStatusOutput.html(@output).css('font-size', "#{atom.config.getInt('editor.fontSize')}px")

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
      atom.workspaceView.prependToBottom(this) unless @hasParent()
