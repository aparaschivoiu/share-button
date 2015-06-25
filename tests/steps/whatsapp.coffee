path = require 'path'

fixture = (name) ->
  fixtureBase = path.join(path.resolve(__dirname, "../", "fixtures"), name)
  return "file:///" + fixtureBase + '.html'

module.exports = ->
  @Given /^I create a Whatsapp Share Button$/, () ->
    @driver.get(fixture('whatsapp'))

  @When /^I click the Whatsapp Share Button$/, () ->
    new @Widget
      root: 'label'
    .click()

  @Then /^I should see the Whatsapp button$/, () ->
    new @Widgets
      .ShareButtonNetworks()
      .filter( (item) ->
        item.getAttribute('style')
          .then (style) ->
            style is 'display: block;'
          .then (itemStyle) ->
            item.hasClass('whatsapp')
              .then (itemClass) ->
                return itemStyle && itemClass
      )
      .should.eventually.have.length(1)

  @When /^I click the Whatsapp button$/, () ->
    new @Widgets
    .ShareButtonNetworks()
    .filter( (item) ->
      item.hasClass('whatsapp')
    )
    .then (list) ->
      list[0].click()

  @Then /^I should see a new Whatsapp window$/, () ->
    # express the regexp above with the code you wish you had
