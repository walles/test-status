fs   = require 'fs'
path = require 'path'

TestStatusStatusBarView = require './test-status-status-bar-view'
TestStatusView = require './test-status-view'

module.exports =
  # Public: Active the package and initialize the test-status views.
  #
  # Returns nothing.
  activate: ->
    return unless fs.existsSync(path.join(atom.project.path, 'Rakefile'))

    createStatusEntry = =>
      testStatusView = new TestStatusView
      @testStatusStatusBar = new TestStatusStatusBarView(testStatusView)

    if atom.workspaceView.statusBar
      createStatusEntry()
    else
      atom.packages.once 'activated', ->
        createStatusEntry()

  # Public: Deactivate the package and destroy the test-status views.
  #
  # Returns nothing.
  deactivate: ->
    @testStatusStatusBar?.destroy()
    @testStatusStatusBar = null
