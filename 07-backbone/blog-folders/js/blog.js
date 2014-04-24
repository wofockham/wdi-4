var blog = blog || {};

blog.blogPosts = new blog.Posts([
  new blog.Post({id: 1, title: 'Web Development', slug: 'web-dev', content: 'Lorem ipsum'}),
  new blog.Post({id: 2, title: 'Web Design', slug: 'web-design', content: 'Lorem ipsum ipsum'}),
  new blog.Post({id: 3, title: 'Photography', slug: 'photos', content: 'Lorem IPSUM ipsum ipsum'}),
  new blog.Post({id: 4, title: 'Coffee', slug: 'coffee', content: 'Lorem coffee ipsum'})
]);

blog.router = new blog.AppRouter();
$(document).ready(function () {
  Backbone.history.start();
});
