TestStatusView = require '../lib/test-status-view'
{WorkspaceView} = require 'atom'

describe "TestStatusView", ->
  it "has one valid test", ->
    expect("life").toBe "easy"
