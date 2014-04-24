var blog = blog || {};

blog.PostListView = Backbone.View.extend({
  tagName: 'li',
  events: {
    'click': 'viewPost'
  },
  initialize: function () {
    this.template = _.template($('#postListView').html());
  },
  render: function () {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  },
  viewPost: function (event) {
    event.preventDefault();
    blog.router.navigate('posts/' + this.model.get('slug'), true);
  }
});
