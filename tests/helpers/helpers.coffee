path = require 'path'

module.exports = ->

  @Helpers = @Helpers || {}

  @Helpers.fixture = (name) ->
    fixtureBase = path.join(path.resolve(__dirname, "../", "fixtures"), name)
    return "file:///" + fixtureBase + '.html'
