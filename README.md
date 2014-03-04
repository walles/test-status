# Test Status Package

Adds the status of your `rake` command to the Atom status bar when you save a
Ruby source file.

![Test Status Usage](https://raw.github.com/tombell/test-status/master/screenshots/atom-test-status.gif)

## Installing

Use the Atom package manager, which can be found in the Settings view or run
`apm install test-status` from the command line.

## Usage

The Test Status package when run `rake` for your project (if a `Rakefile`)
exists in your project root. A green Hubot face will show if the tests all
passed and a red Hubot face if any test failed.

You can toggle the test output panel using the default keymappign `cmd+l` on Mac
OS X and `ctrl+l`.

The following _commands_ are available for you to remap and run via the Command
Palette.

* `test-status:toggle-output` - Toggles the test results output panel
* `test-status:run-tests` - Runs the configured test command

## Coming Soon

I am working on finding the best way to support a configurable test command,
rather than just supporting `rake`. You can add your suggestions to the open
[issue #2](https://github.com/tombell/test-status/issues/2).

## Support

If you wish to support this package and help further its development, feel free
to tip via Gittip.

[![Gittip](http://img.shields.io/gittip/tombell.png)](https://www.gittip.com/tombell/)
