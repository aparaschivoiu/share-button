module.exports = ->
  @Given /^I create a Linkedin Share Button$/, () ->
    @driver.get(@Helpers.fixture('linkedin'))

  @When /^I click the Linkedin Share Button$/, () ->
    new @Widgets.ShareButton().clickButton()

  @Then /^I should see the Linkedin button$/, () ->
    new @Widgets
      .ShareButtonNetworks()
      .filter( (item) ->
        item.getAttribute('style')
          .then (style) ->
            style is 'display: block;'
          .then (itemStyle) ->
            item.hasClass('linkedin')
              .then (itemClass) ->
                return itemStyle && itemClass
      )
      .should.eventually.have.length(1)

  @When /^I click the Linkedin button$/, () ->
    new @Widgets
    .ShareButtonNetworks()
    .filter( (item) ->
      item.hasClass('linkedin')
    )
    .then (list) ->
      list[0].click('a')

  @Then /^I should have a correct Linkedin share url$/, () ->
    new @Widgets
    .ShareButtonNetworks()
    .filter( (item) ->
      item.hasClass('linkedin')
    )
    .then (list) ->
      list[0].getAttribute(
        selector: 'a',
        attribute: 'href'
      ).should.eventually.eq('https://www.linkedin.com/shareArticle?mini=true&url=http%3A%2F%2Fwww.example.com&title=linkedin%20title&summary=linkedin%20description')
