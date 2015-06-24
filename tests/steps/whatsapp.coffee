path = require 'path'

fixture = (name) ->
  fixtureBase = path.join(path.resolve(__dirname, "../", "fixtures"), name)
  return "file:///" + fixtureBase + '.html'

module.exports = ->
  @Given /^I create a Whatsapp Share Button$/, () ->
    @driver.get(fixture('whatsapp'))

  @When /^I click the Whatsapp Share Button$/, () ->
    new @Widgets.ShareButtonNetworks().click()

  @Then /^I should see the Whatsapp button$/, () ->
    new @Widgets
      .ShareButtonNetworks()
      .filter( (item) ->
        item.getAttribute('style').then (style) ->
          style == 'display: block;')
      .should.eventually.have.length(1)

  @When /^I click the Whatsapp button$/, () ->
    # express the regexp above with the code you wish you had

  @Then /^I should see a new Whatsapp window$/, () ->
    # express the regexp above with the code you wish you had
