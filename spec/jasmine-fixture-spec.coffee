describe "affix", ->
  beforeEach ->
    this.addMatchers
      toInjectProperly: ->
        $result = affix(this.actual)
        $.contains('body',this.actual) && $result.is(this.actual)

  _([
    '.foo',
    '.bar',
    '#baz',
    '#foo .panda',
    'input#man .restroom',
    '.pants.zipper',
    'span#spaghetti.sauce',
    # 'article.sauce#spaghetti',
    # 'foo > bar'
  ]).each (selector) ->
    Then -> expect(selector).toInjectProperly()

  context "chaining", ->
    Given -> @$container = affix('.container')
    When -> @$container.affix('#content')
    Then -> expect(@$container).toContain('#content')