---
---

$(document).on("click", ".social a", ->
  height = 305
  width = 600
  top = (screen.height / 2) - (height / 2)
  left = (screen.width / 2) - (width / 2)

  window.open($(this).attr("href"), "share", "status=1,height=#{height},width=#{width},top=#{top},left=#{left},resizable=0")
  false
)

showOverlay = (klass) ->
  $(".overlay.#{klass}").removeClass("hidden")
  setTimeout(->
    $(".overlay.#{klass} .inner").addClass("animated zoomIn")
    $(".overlay.#{klass} .inner").one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend", ->
      $(this).removeClass("animated zoomIn").css(opacity: 1)
    )
  , 50)

hideOverlay = (klass) ->
  $(".overlay.#{klass}").addClass("hidden")
  $(".overlay.#{klass} .inner").css(opacity: 0)

$(document).on("click", "button.manifesto", ->
  showOverlay("manifesto")
)

$(document).on("click", ".overlay.manifesto .close", ->
  hideOverlay("manifesto")
)

$(document).on("click", "button.mobile-menu", ->
  showOverlay("mobile-menu")
)

$(document).on("click", ".overlay.mobile-menu .close", ->
  hideOverlay("mobile-menu")
)

$(document).on("focus", ".launch", ->
  return if $(this).parent().hasClass("completed")
  $(this).parent().addClass("focused")
  $(this).attr("placeholder", $(this).data("focus-placeholder"))
)

complete = ->
  $("form").removeClass("focused").addClass("completed")
  $(".launch").val("").attr("disabled", true).attr("placeholder", $(".launch").data("complete-placeholder"))
  $(".btns .social").css("display", "inline-block")
  Placeholders.enable()

$(document).on("submit", "form", ->
  $.getJSON(
    "//infeedl.createsend.com/t/t/s/dttytu/?callback=?"
    { "cm-dttytu-dttytu": $(this).find(".launch").val() }
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
