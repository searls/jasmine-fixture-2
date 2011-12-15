# jasmine-fixture 2

In *jQuery*, you give `$()` a CSS selector and it *finds* elements on the DOM.

In jasmine-fixture, you give `affix()` a CSS selector and it *adds* elements to the DOM.

**Warning:** This isn't finished yet. Once the new `affix()` method covers all the CSS selection edge cases it ought to, this repo will be merged with [jasmine-fixture](https://github.com/searls/jasmine-fixture), jasmine-fixture's `inject()` method will be deprecated, and `affix()` will live on going forward.

## affix()

Say you want to write a test for code that selects the DOM like this:

``` javascript
$('#toddler .hidden.toy')
```

In the good ol' days, you'd have to append some HTML to the DOM like this:

``` javascript
beforeEach(function(){
  $('<div id="toddler"><div class="hidden toy"></div></div>').appendTo('body');
});

afterEach(function(){
  $('#toddler').remove()
});
```

jasmine-fixture's `affix` method lets you do this instead:

``` javascript
beforeEach(function(){
  affix('#toddler .hidden.toy')
});

```

It's just like jQuery, but in reverse! (And, of course, it'll clean up after itself after your spec runs.)
