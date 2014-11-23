$ ->

  testimonial_id = (el) ->
    "#testimonial-#{$(el).data('id')}"

  $('#movies-with-testimonials').on 'click', '.edit', (e) ->
    e.preventDefault()
    li = $(testimonial_id(this))
    li.children('.info').hide()
    li.children('.edit-form').show()
    $('#create-testimonial-form').hide()

  $('#movies-with-testimonials').on 'click', '.cancel', (e) ->
    e.preventDefault()
    li = $(testimonial_id(this))
    li.children('.info').show()
    li.children('.edit-form').hide()
    $('#create-testimonial-form').show()
