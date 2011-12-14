jQuery.fn.affix = window.affix = (selectorOptions) ->
  _(selectorOptions.split(' ')).inject(($parent, elementSelector) ->
    elementSplit = elementSelector.split('#')
    elementName = elementSplit[0] if elementSplit.length > 1

    idSplit = if elementSplit.length > 1 then elementSplit[1].split('.') else elementSelector.split('.')
    id = idSplit[0]
    classes = _(idSplit).rest()

    $("<#{elementName || "div"} id=\"#{id}\" class=\"#{classes.join(' ')}\"></div>").appendTo($parent)
  , if this.jquery? then this else $('body'))
