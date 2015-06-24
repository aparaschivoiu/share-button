path = require 'path'

fixture = (name) ->
  fixtureBase = path.join(path.resolve(__dirname, "../", "fixtures"), name)
  return "file:///" + fixtureBase + '.html'

module.exports = ->
  @Given /^I create an Email Share Button$/, () ->
    @driver.get(fixture('email'))

  @When /^I click the Email Share Button$/, () ->
    new @Widgets.ShareButtonNetworks().click()

  @Then /^I should see the Email button$/, () ->
    new @Widgets
      .ShareButtonNetworks()
      .filter( (item) ->
        item.getAttribute('style').then (style) ->
          style == 'display: block;')
      .should.eventually.have.length(1)

  @When /^I click the Email button$/, () ->
    # express the regexp above with the code you wish you had

  @Then /^I should see a new Email window$/, () ->
    # express the regexp above with the code you wish you had
