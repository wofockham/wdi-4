var id = 0;
var Animal = Backbone.Model.extend({
  defaults: {
    type: 'animal',
    ecosystem: '',
    stripes: 0
  },

  initialize: function () {
    console.log("I am an animal");
    this.set('animalID', id++);
    this.on("change:stripes", function (instance) {
      var stripes = instance.get("stripes");
      alert("i now have " + stripes + " stripes");
    })
  }
});

var Zoo = Backbone.Collection.extend({
  model: Animal
});

var animal1 = new Animal({type: 'giraffe', ecosystem: 'savannah'});
var animal2 = new Animal({type: 'zebra', ecosystem: 'savannah', stripes: 12});
var animal3 = new Animal({type: 'giraffa', ecosystem: 'savannah'});

var myZoo = new Zoo([animal1, animal2, animal3]);

var ZooView = Backbone.View.extend({
  el: '#main',

  initialize: function () {
    this.template = _.template($('#animal-template').html());
  },

  render: function () {
    this.$el.html('<h1>Welcome to the Zoo</h1>');
    this.$el.append('<ul id="animals"></ul>');
    var view = this;
    this.collection.each(function (animal) {
      $('#animals').append(view.template(animal.toJSON()));
    });
  }
});

var AnimalView = Backbone.View.extend({
  el: '#main',

  initialize: function () {
    this.template = _.template($('#animal-view-template').html());
  },

  render: function () {
    this.$el.html( this.template(this.model.toJSON()) );
  }
});

var AppRouter = Backbone.Router.extend({
  routes: {
    "": "index",
    "animals/:id": "viewAnimal"
  },
  index: function () {
    var zooView = new ZooView({collection: myZoo});
    zooView.render();
  },
  viewAnimal: function (id) {
    var animalView = new AnimalView({model: myZoo.models[id]});
    animalView.render();
  }
});

$(document).ready(function () {
  var router = new AppRouter();
  Backbone.history.start();
});
