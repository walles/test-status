fs   = require 'fs'
path = require 'path'

TestStatusStatusBarView = require './test-status-status-bar-view'

module.exports =
  activate: ->
    return unless fs.existsSync(path.join(atom.project.path, 'Rakefile'))

    createStatusEntry = ->
      new TestStatusStatusBarView

    if atom.workspaceView.statusBar
      createStatusEntry()
    else
      atom.packages.once 'activated', ->
        createStatusEntry()
