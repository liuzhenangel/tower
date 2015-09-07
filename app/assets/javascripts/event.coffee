$(document).on 'ready page:load', ->
  $('#btn-load-more').appear()
  $('body').delegate '#btn-load-more', 'appear', (event) ->
    event.preventDefault()
    page = Number($('#current_page').val()) + 1
    team_id = $('#team_id').val()
    if $(this).text() != '没有更多内容了'
      me = $(this)
      me.hide()
      $.ajax "/teams/#{team_id}/events/load?page=#{page}",
        type: 'GET'
        success: (res) ->
          me.show()
          console.log('xxxxxxx')


