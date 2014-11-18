---
---

$(document).on("click", "button.manifesto", ->
  $(".overlay.manifesto").removeClass("hidden")
  setTimeout(->
    $(".overlay.manifesto .inner").addClass("shown")
  , 50)
)

$(document).on("click", ".overlay.manifesto .close", ->
  $(".overlay.manifesto .inner").removeClass("shown")
  setTimeout(->
    $(".overlay.manifesto").addClass("hidden")
  , 400)
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
        alert(data.Message)
  ).bind(this))

  false
)
