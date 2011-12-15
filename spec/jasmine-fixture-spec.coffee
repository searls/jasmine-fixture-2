describe "affix", ->
  beforeEach ->
    this.addMatchers
      toInjectProperly: ->
        $result = affix(this.actual)
        $.contains('body',this.actual) && $result.is(this.actual)

  EXAMPLES = [
    '.foo',
    '.bar',
    '#baz',
    '#foo .panda',
    'input#man .restroom',
    '.pants.zipper',
    'span#spaghetti.sauce',
    # 'article.sauce#spaghetti',
    # 'foo > bar'
  ]

  _(EXAMPLES).each (selector) ->
    Then -> expect(selector).toInjectProperly()
    Then -> expect($('body')).not.toContain(selector)



  context "chaining", ->
    Given -> @$container = affix('.container')
    When -> @$container.affix('#content')
    Then -> expect(@$container).toContain('#content')