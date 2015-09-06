$(document).on 'ready page:load', ->
  $('#form-comment_submit').click (event) ->
    event.preventDefault()
    url = ''

    messages = $('.message_content').val()
    $('.message_content').val('')
    false

  # 评论编辑框
  editor = new Simditor(
      textarea: $('#editor')
      upload: true
      toolbar: ['bold', 'italic', 'underline', 'strikethrough', 'color', '|', 'ol', 'ul', 'blockquote', 'code', '|', 'link', 'image', '|', 'indent', 'outdent', '|', 'hr', 'table']
      )
