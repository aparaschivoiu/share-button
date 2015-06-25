path = require 'path'

fixture = (name) ->
  fixtureBase = path.join(path.resolve(__dirname, "../", "fixtures"), name)
  return "file:///" + fixtureBase + '.html'

module.exports = ->
  @Given /^I create a Facebook Share Button$/, () ->
    @driver.get(fixture('facebook'))

  @When /^I click the Facebook Share Button$/, () ->
    new @Widget
      root: 'label'
    .click()

  @Then /^I should see the Facebook button$/, () ->
    new @Widgets
      .ShareButtonNetworks()
      .filter( (item) ->
        item.getAttribute('style')
          .then (style) ->
            style is 'display: block;'
          .then (itemStyle) ->
            item.hasClass('facebook')
              .then (itemClass) ->
                return itemStyle && itemClass
      )
      .should.eventually.have.length(1)

  @When /^I click the Facebook button$/, () ->
    new @Widgets
    .ShareButtonNetworks()
    .filter( (item) ->
      item.hasClass('facebook')
    )
    .then (list) ->
      list[0].click()

  @Then /^I should see a new Facebook window$/, () ->
    # express the regexp above with the code you wish you had
