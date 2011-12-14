window.inject = (selectorOptions) ->
  _(selectorOptions.split(' ')).inject(($parent, elementSelector) ->
    elementSplit = elementSelector.split('#')
    if elementSplit.length > 1
      elementName = elementSplit[0] || "div"

    idSplit = if elementSplit.length > 1 then elementSplit[1].split('.') else elementSelector.split('.')
    id = idSplit[0]
    classes = _(idSplit).rest()

    $("<#{elementName} id=\"#{id}\" class=\"#{classes.join(' ')}\"></div>").appendTo($parent)
  , $('body'))
