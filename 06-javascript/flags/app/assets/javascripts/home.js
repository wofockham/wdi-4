$(document).ready(function() {

  var countriesTemplate = Handlebars.compile($('#countries-template').html());
  var counter = 0;

  var populateCountries = function (url) {
    $.getJSON(url, function (countries) {
      if (countries.length == 0) {
        $(window).off('scroll');
      }
      _(countries).each(function (country, i) {
        var countryHTML = countriesTemplate(country);
        $('#content').append(countryHTML);
      });
    });
  };


  $('#clear').on('click', function () {
    $('#content').empty();
    counter = 0;
  });

  $('#get-all').on('click', function () {
    populateCountries('/countries');
  });

  $('#get-one').on('click', function () {
    var url = '/countries/1/' + counter++;
    populateCountries(url);
  });

  $('#get-five').on('click', function () {
    var url = '/countries/5/' + counter;
    populateCountries(url);
    counter += 5;
  });

  $('#get-n').on('click', function () {
    var n = ~~$('#get-count').val();
    var url = ['/countries', n, counter].join('/');
    populateCountries(url);
    counter += n;
  });

  var lazyLoad = function () {
    var $window = $(window);
    if($window.height() + $window.scrollTop() >= ($(document).height() - 200)) {
      var url = '/countries/20/' + counter;
      populateCountries(url);
      counter += 20;
    }
  };

  $(window).on('scroll', _.throttle(lazyLoad, 200)).trigger('scroll');

  $('#content').on('click', '.country', function () {
    var id = $(this).data('countryid'); // data-countryid
    $.getJSON('/country/' + id, function (country) {
      alert(country.created_at);
    });
  });

});
