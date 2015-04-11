$ ->
      flashCallback = ->
        $("#alert-top").fadeOut()
      $("#alert-top").bind 'click', (ev) =>
        $("#alert-top").fadeOut()
      setTimeout flashCallback, 3000