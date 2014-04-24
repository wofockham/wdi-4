////////////////////////////////// Models

var Post = Backbone.Model.extend({
  idAttribute: 'slug',
  defaults: {
    title: 'New Post Title',
    slug: 'new-post',
    content: 'New post content'
  }
});

var Posts = Backbone.Collection.extend({
  model: Post
});

var blogPosts = new Posts([
  new Post({id: 1, title: 'Web Development', slug: 'web-dev', content: 'Lorem ipsum'}),
  new Post({id: 2, title: 'Web Design', slug: 'web-design', content: 'Lorem ipsum ipsum'}),
  new Post({id: 3, title: 'Photography', slug: 'photos', content: 'Lorem IPSUM ipsum ipsum'}),
  new Post({id: 4, title: 'Coffee', slug: 'coffee', content: 'Lorem coffee ipsum'})
]);

//////////////////////////////////// Views
var AppView = Backbone.View.extend({
  el: '#main',
  initialize: function () {
    this.template = _.template($('#appView').html());
  },
  render: function () {
    this.$el.html(this.template());

    this.collection.each(function (post) {
      var view = new PostListView({model:post});
      $('#posts').append(view.render().el);
    });
  }
});

var PostListView = Backbone.View.extend({
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
    router.navigate('posts/' + this.model.get('slug'), true);
  }
});

var PostView = Backbone.View.extend({
  el: '#main',
  initialize: function () {
    this.template = _.template($('#postView').html());
    this.render();
  },
  render: function () {
    this.$el.html(this.template(this.model.toJSON()));
  }
});

//////////////////////////////////////// Router
var AppRouter = Backbone.Router.extend({
  routes: {
    '': 'index',
    'posts/:id': 'showPost',
    '*anything': 'goHome'
  },

  index: function () {
    var view = new AppView({collection: blogPosts});
    view.render();
    console.log('you are at the index page');
  },

  showPost: function (slug) {
    var post = blogPosts.get(slug);
    new PostView({model: post});
  },

  goHome: function () {
    document.location.hash = '';
  }
});

var router = new AppRouter();
$(document).ready(function () {
  Backbone.history.start();
});
