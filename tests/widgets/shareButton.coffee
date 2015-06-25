path = require 'path'

module.exports = ->

  @Widgets = @Widgets || {}

  @Widgets.ShareButton = @Widget.extend
    root: 'share-button'
    clickButton: ->
      return @click('label')

  @Widgets.ShareButtonNetworks = @Widget.List.extend
    root: 'share-button'

  @Widgets.fixture = (name) ->
    fixtureBase = path.join(path.resolve(__dirname, "../", "fixtures"), name)
    return "file:///" + fixtureBase + '.html'
