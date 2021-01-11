$(document).on "ajax:beforeSend", "#emails-form", ()->
  $("#email-info").html "se asta procesando tu peticion"
$(document).on "ajax:success", "#emails-form", (e,data,estado,xhr)->
  $(this).slideUp()
  $("#email-info").html "ya estas en la fila de las invitaciones betas"
$(document).on "ajax:error", "#emails-form", (e,data,estado,xhr)->
  $("#email-info").html data.responseJSON.email[0]