{View} = require 'atom'

module.exports =
class TestStatusView extends View
  @content: ->
    @div class: 'inline-block', =>
      @span outlet:  'testStatus', class: 'test-status fail', tabindex: -1, 'Test Status'

  initialize: ->
    atom.workspace.eachEditor (editor) =>
      @handleBufferEvents(editor)

    @subscribe atom.packages.once 'activated', =>
      setTimeout =>
        atom.workspaceView.statusBar.appendLeft(this)
      , 1

  handleBufferEvents: (editor) ->
    buffer = editor.getBuffer()

    @subscribe buffer.on 'will-be-saved', =>
      @testStatus.text('Running...').addClass('pending').removeClass('success fail')

    @subscribe buffer.on 'destroyed', =>
      @testStatus.text('').removeClass('pending success fail')
      @unsubscribe(buffer)

  destroy: ->
    @detach()
