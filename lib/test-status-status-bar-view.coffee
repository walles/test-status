{spawn} = require 'child_process'
{View}  = require 'atom'

module.exports =
class TestStatusStatusBarView extends View
  @content: ->
    @div class: 'inline-block', =>
      @span outlet:  'testStatus', class: 'test-status icon icon-hubot', tabindex: -1, ''

  initialize: (@testStatusView) ->
    @attach()

    atom.workspace.eachEditor (editor) =>
      @handleBufferEvents(editor)

    @subscribe this, 'click', =>
      @testStatusView.toggle()

  attach: ->
    atom.workspaceView.statusBar.appendLeft(this)

  handleBufferEvents: (editor) ->
    buffer = editor.getBuffer()

    @subscribe buffer.on 'will-be-saved', =>
      @testStatus.removeClass('success fail').addClass('pending')
      @runTests()

    @subscribe buffer.on 'destroyed', =>
      @testStatus.removeClass('pending success fail')
      @unsubscribe(buffer)

  runTests: ->
    rake = spawn('rake', [], cwd: atom.project.path)
    output = ''

    rake.stdout.on 'data', (data) =>
      output += data.toString()
      console.log "rake data", data.toString()

    rake.stderr.on 'data', (data) =>
      output += data.toString()
      console.log "rake error", data.toString()

    rake.on 'close', (code) =>
      @testStatusView.update(output)

      if code is 0
        @testStatus.removeClass('pending fail').addClass('success')
      else
        @testStatus.removeClass('pending success').addClass('fail')
