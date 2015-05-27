TestStatusStatusBarView = require './test-status-status-bar-view'

module.exports =
  config:
    autorun:
      type: 'boolean'
      default: true

  # Public: Active the package and initialize the test-status views.
  #
  # Returns nothing.
  activate: ->
    createStatusEntry = =>
      @testStatusStatusBar = new TestStatusStatusBarView

      # Run tests once on startup
      if atom.config.get('test-status.autorun')
        @testStatusStatusBar.executeCommand()

    statusBar = document.querySelector('status-bar')

    if statusBar?
      createStatusEntry()
    else
      atom.packages.onDidActivateInitialPackages ->
        createStatusEntry()

  # Public: Deactivate the package and destroy the test-status views.
  #
  # Returns nothing.
  deactivate: ->
    @testStatusStatusBar?.destroy()
    @testStatusStatusBar = null
