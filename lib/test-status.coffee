fs   = require 'fs'
path = require 'path'

TestStatusStatusBarView = require './test-status-status-bar-view'
TestStatusView = require './test-status-view'

module.exports =
  activate: ->
    return unless fs.existsSync(path.join(atom.project.path, 'Rakefile'))

    createStatusEntry = ->
      testStatusView = new TestStatusView
      new TestStatusStatusBarView(testStatusView)

    if atom.workspaceView.statusBar
      createStatusEntry()
    else
      atom.packages.once 'activated', ->
        createStatusEntry()
