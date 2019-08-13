$(document).ready ->

  $("#invertion-button").on('click', () ->
    source_currency = $("#source_currency").val()
    target_currency = $("#target_currency").val()
    $("#source_currency").val(target_currency)
    $("#target_currency").val(source_currency)
  )

  $('#amount').on('input', autoConvert)
  $('#source_currency').on('change', autoConvert)
  $('#target_currency').on('change', autoConvert)
  $('#invertion-button').on('click', autoConvert)


autoConvert = () ->            
    $.ajax '/convert',
        type: 'GET'
        dataType: 'json'
        data: {
                source_currency: $("#source_currency").val(),
                target_currency: $("#target_currency").val(),
                amount: $("#amount").val()
              }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').val(data.value)
      return false;

  