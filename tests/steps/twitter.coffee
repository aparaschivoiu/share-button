path = require 'path'

fixture = (name) ->
  fixtureBase = path.join(path.resolve(__dirname, "../", "fixtures"), name)
  return "file:///" + fixtureBase + '.html'

module.exports = ->
  @Given /^I create a Twitter Share Button$/, () ->
    @driver.get(fixture('twitter'))

  @When /^I click the Twitter Share Button$/, () ->
    new @Widgets.ShareButtonNetworks().click()

  @Then /^I should see the Twitter button$/, () ->
    new @Widgets
      .ShareButtonNetworks()
      .filter( (item) ->
        item.getAttribute('style').then (style) ->
          style == 'display: block;')
      .should.eventually.have.length(1)

  @When /^I click the Twitter button$/, () ->
    # express the regexp above with the code you wish you had

  @Then /^I should see a new Twitter window$/, () ->
    # express the regexp above with the code you wish you had
