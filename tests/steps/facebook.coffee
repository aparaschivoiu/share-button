module.exports = ->
  @Given /^I create a Facebook Share Button$/, () ->
    @driver.get(@Helpers.fixture('facebook'))

  @When /^I click the Facebook Share Button$/, () ->
    new @Widgets.ShareButton().clickButton()

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
