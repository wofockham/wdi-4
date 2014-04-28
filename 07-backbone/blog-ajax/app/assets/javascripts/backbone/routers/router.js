BlogAjax.Routers.appRouter = Backbone.Router.extend({
  routes: {
    '': 'index',
    'posts/:id': 'showPost',
    '*anything': 'goHome'
  },

  index: function () {
    var view = new BlogAjax.Views.AppView({collection: BlogAjax.blogPosts});
    view.render();
  },

  showPost: function (slug) {
    var post = BlogAjax.blogPosts.get(slug);
    new BlogAjax.Views.PostView({model: post});
  },

  goHome: function () {
    document.location.hash = '';
  }
});
