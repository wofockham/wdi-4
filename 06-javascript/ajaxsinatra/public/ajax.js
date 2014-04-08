$(document).ready(function () {
  $('#number_getter').on('click', function () {
    $.ajax({
      type: 'GET',
      url: '/random.json',
      dataType: 'json'
    }).done(function (data) {
        console.log(data);
        $('#number').html(data.number);
    }).done(function (data) {
        $('title').html(data.number);
    }).fail(function () {
      $('#number').html(23);
    });
  });

  $('#contact').on('submit', function (event) {
    event.preventDefault();
    $.ajax({
      type: 'POST',
      url: '/greeter',
      data: {
        first: $('#first').val(),
        surname: $('[name="surname"]').val()
      }
    }).done(function (resp) {
      $('#contact').fadeOut();
      $('body').append('<p>' + resp + '</p>');
    });
  });
});
