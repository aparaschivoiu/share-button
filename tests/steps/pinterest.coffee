module.exports = ->
  @Given /^I create a Pinterest Share Button$/, () ->
    @driver.get(@Helpers.fixture('pinterest'))

  @When /^I click the Pinterest Share Button$/, () ->
    new @Widgets.ShareButton().clickButton()

  @Then /^I should see the Pinterest button$/, () ->
    new @Widgets
      .ShareButtonNetworks()
      .filter( (item) ->
        item.getAttribute('style')
          .then (style) ->
            style is 'display: block;'
          .then (itemStyle) ->
            item.hasClass('pinterest')
              .then (itemClass) ->
                return itemStyle && itemClass
      )
      .should.eventually.have.length(1)

  @When /^I click the Pinterest button$/, () ->
    new @Widgets
    .ShareButtonNetworks()
    .filter( (item) ->
      item.hasClass('pinterest')
    )
    .then (list) ->
      list[0].click()

  @Then /^I should see a new Pinterest window$/, () ->
    # express the regexp above with the code you wish you had
