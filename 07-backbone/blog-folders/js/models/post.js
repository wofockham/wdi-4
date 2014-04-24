var blog = blog || {};

blog.Post = Backbone.Model.extend({
  idAttribute: 'slug',
  defaults: {
    title: 'New Post Title',
    slug: 'new-post',
    content: 'New post content'
  }
});
