$(document).on 'ready page:load', ->
  # 评论编辑框
  if $('.simditor')[0]
    editor = new Simditor(
      textarea: $('#editor')
      upload: true
      toolbar: ['bold', 'italic', 'underline', 'strikethrough', 'color', '|', 'ol', 'ul', 'blockquote', 'code', '|', 'link', 'image', '|', 'indent', 'outdent', '|', 'hr', 'table']
    )
