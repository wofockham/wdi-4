var blog = blog || {};

blog.AppView = Backbone.View.extend({
  el: '#main',
  initialize: function () {
    this.template = _.template($('#appView').html());
  },
  render: function () {
    this.$el.html(this.template());

    this.collection.each(function (post) {
      var view = new blog.PostListView({model:post});
      $('#posts').append(view.render().el);
    });
  }
});
