TestStatusView = require '../lib/test-status-view.coffee'

describe "when linkifying the empty string", ->
  it "returns the empty string", ->
    expect(TestStatusView.linkify("")).toEqual("")

describe "when linkifying something without file names in it", ->
  it "returns an un-modified string", ->
    expect(TestStatusView.linkify("monkey")).toEqual("monkey")

describe "when linkifying something with a non-existing file in it", ->
  it "returns an un-modified string", ->
    string = "monkey /doesntexist hello"
    expect(TestStatusView.linkify(string)).toEqual(string)

describe "when linkifying something with an absolute path in it", ->
  it "turns the path into a HTML link",
    expect("test implemented").toEqual(true)

describe "when linkifying something with a relative path in it", ->
  it "turns the path into a HTML link",
    expect("test implemented").toEqual(true)

describe "when linkifying something with an http:// URL in it", ->
  it "makes the URL clickable",
    expect("test implemented").toEqual(true)

describe "when linkifying something with an https:// URL in it", ->
  it "makes the URL clickable",
    expect("test implemented").toEqual(true)

describe "when linkifying something with a file:/// URL in it", ->
  it "makes the URL clickable",
    expect("test implemented").toEqual(true)

describe "when linkifying an absolute path + line number", ->
  it "makes an URL to the correct line",
    expect("test implemented").toEqual(true)

describe "when linkifying an absolute path + line & column number", ->
  it "makes an URL to the correct line and column",
    expect("test implemented").toEqual(true)
