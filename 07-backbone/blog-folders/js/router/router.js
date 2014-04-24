var blog = blog || {};

blog.AppRouter = Backbone.Router.extend({
  routes: {
    '': 'index',
    'posts/:id': 'showPost',
    '*anything': 'goHome'
  },

  index: function () {
    var view = new blog.AppView({collection: blog.blogPosts});
    view.render();
    console.log('you are at the index page');
  },

  showPost: function (slug) {
    var post = blog.blogPosts.get(slug);
    new blog.PostView({model: post});
  },

  goHome: function () {
    document.location.hash = '';
  }
});
