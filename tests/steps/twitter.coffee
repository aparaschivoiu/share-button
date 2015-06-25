module.exports = ->
  @Given /^I create a Twitter Share Button$/, () ->
    @driver.get(@Widgets.fixture('twitter'))

  @When /^I click the Twitter Share Button$/, () ->
    new @Widgets.ShareButton().clickButton()

  @Then /^I should see the Twitter button$/, () ->
    new @Widgets
      .ShareButtonNetworks()
      .filter( (item) ->
        item.getAttribute('style')
          .then (style) ->
            style is 'display: block;'
          .then (itemStyle) ->
            item.hasClass('twitter')
              .then (itemClass) ->
                return itemStyle && itemClass
      )
      .should.eventually.have.length(1)

  @When /^I click the Twitter button$/, () ->
    new @Widgets
    .ShareButtonNetworks()
    .filter( (item) ->
      item.hasClass('twitter')
    )
    .then (list) ->
      list[0].click()

  @Then /^I should see a new Twitter window$/, () ->
    # express the regexp above with the code you wish you had
