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
