{spawn} = require 'child_process'
fs      = require 'fs'
path    = require 'path'

{View}  = require 'atom'

module.exports =
class TestStatusView extends View
  @content: ->
    @div class: 'inline-block', =>
      @span outlet:  'testStatus', class: 'test-status icon icon-hubot', tabindex: -1, ''

  initialize: ->
    return unless fs.existsSync(path.join(atom.project.path, 'Rakefile'))

    atom.workspace.eachEditor (editor) =>
      @handleBufferEvents(editor)

    @subscribe atom.packages.once 'activated', =>
      setTimeout =>
        atom.workspaceView.statusBar.appendLeft(this)
      , 1

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

    rake.stdout.on 'data', (data) ->
      console.log "TestStatus: on data"

    rake.stderr.on 'data', (data) ->
      console.log "TestStatus: on error"

    rake.on 'close', (code) =>
      if code is 0
        @testStatus.removeClass('pending fail').addClass('success')
      else
        @testStatus.removeClass('pending success').addClass('fail')

  destroy: ->
    @detach()
