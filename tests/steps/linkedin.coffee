path = require 'path'

fixture = (name) ->
  fixtureBase = path.join(path.resolve(__dirname, "../", "fixtures"), name)
  return "file:///" + fixtureBase + '.html'

module.exports = ->
  @Given /^I create a Linkedin Share Button$/, () ->
    @driver.get(fixture('linkedin'))

  @When /^I click the Linkedin Share Button$/, () ->
    new @Widgets.ShareButtonNetworks().click()

  @Then /^I should see the Linkedin button$/, () ->
    new @Widgets
      .ShareButtonNetworks()
      .filter( (item) ->
        item.getAttribute('style').then (style) ->
          style == 'display: block;')
      .should.eventually.have.length(1)

  @When /^I click the Linkedin button$/, () ->
    # express the regexp above with the code you wish you had

  @Then /^I should see a new Linkedin window$/, () ->
    # express the regexp above with the code you wish you had
