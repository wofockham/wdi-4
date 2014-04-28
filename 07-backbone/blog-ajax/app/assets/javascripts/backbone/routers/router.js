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

  showPost: function (id) {
    var post = BlogAjax.blogPosts.get(id);
    new BlogAjax.Views.PostView({model: post});
  },

  goHome: function () {
    document.location.hash = '';
  }
});
