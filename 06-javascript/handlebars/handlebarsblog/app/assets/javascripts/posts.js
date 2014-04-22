$(document).ready(function () {

  // Build our template function with the template from application.html.erb
  var post_template = $('#post').html();
  var template = Handlebars.compile( post_template );

  // Fetch JSON version of the post and show it on the page.
  $.getJSON('/posts.json', function (data) {
    var html = template( {posts: data} ); // Magic.
    $('#posts_container').append( html ); // Shove it in the page.
  });
});

