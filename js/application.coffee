---
---

$(document).on("click", "button.manifesto", ->
  $(".overlay.manifesto").removeClass("hidden")
  setTimeout(->
    $(".overlay.manifesto .inner").addClass("animated zoomIn")
    $(".overlay.manifesto .inner").one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend", ->
      $(this).removeClass("animated zoomIn").css(opacity: 1)
    )
  , 50)
)

$(document).on("click", ".overlay.manifesto .close", ->
  $(".overlay.manifesto .inner").addClass("animated zoomOut")
  $(".overlay.manifesto .inner").one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend", ->
    $(this).removeClass("animated zoomOut").css(opacity: 0)
    $(".overlay.manifesto").addClass("hidden")
  )
)

$(document).on("focus", ".launch", ->
  return if $(this).parent().hasClass("completed")
  $(this).parent().addClass("focused")
  $(this).attr("placeholder", $(this).data("focus-placeholder"))
)

complete = ->
  $("form").removeClass("focused").addClass("completed")
  $(".launch").val("").attr("disabled", true).attr("placeholder", $(".launch").data("complete-placeholder"))
  Placeholders.enable()

$(document).on("submit", "form", ->
  $.getJSON(
    "http://infeedl.createsend.com/t/t/s/dttytu/?callback=?"
    { "cm-dttytu-dttytu": $(".launch").val() }
    ((data) ->
      if data.Status.toString() == "200"
        complete()
      else
        $(".launch").parent().removeClass("animated shake")
        setTimeout(->
          $(".launch").parent().addClass("animated shake")
        , 50)
  ).bind(this))

  false
)
