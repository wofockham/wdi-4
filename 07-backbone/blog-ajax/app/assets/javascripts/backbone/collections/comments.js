BlogAjax.Collections.Comments = Backbone.Collection.extend({
  initialize: function (options) {
    this.post_id = options.post_id;
  },
  url: function () {
    var url = ['/posts', this.post_id, 'comments'].join('/');
    return url;
  },
  model: BlogAjax.Models.Post
});
