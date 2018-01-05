$(document).on "turbolinks:load", ->
  $('.order_search').focusout ->
    OrderNr = encodeURIComponent($('.order_search').val())
    $.ajax
      type: 'GET'
      dataType: 'json'
      data: ordernumber: OrderNr
      url: '/orders/get_order_description'#
      error: (xhr, status, error) ->
        console.error 'AJAX Error: ' + status + error
        return
      success: (data) ->
        if data != null
          console.log data
          $('.order_description').val data.description
        else
          $('.order_description').val 'Auftragsnummer nicht vorhanden'
        return
    return
