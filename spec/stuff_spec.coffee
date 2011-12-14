describe "inject", ->
  beforeEach ->
    this.addMatchers
      toInjectProperly: ->
        $result = inject(this.actual)
        $.contains('body',this.actual) && $result.is(this.actual)

  _([
    '.foo',
    '.bar',
    '#baz',
    '#foo .panda',
    'input#man .restroom',
    '.pants.zipper',
    'span#spaghetti.sauce',
#    'article.sauce#spaghetti'
  ]).each (selector) ->
    Then -> expect(selector).toInjectProperly()
