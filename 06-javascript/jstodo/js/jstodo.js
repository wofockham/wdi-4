$(document).ready(function () {

  $('.task button').on('click', function () {
    var $task = $(this).closest('.task');
    console.log('thanks for clicking', this, $task);
    $task.fadeOut(function () {
      $task.appendTo('#completed').fadeIn();
    });
  });

  $('form.task_creator').on('submit', function (event) {
    event.preventDefault();
    var $input = $('#new_task');
    var description = $input.val();
    $input.val('');
    console.log('ready to create new task', description);
    jsTodoApp.createTask(description);
    jsTodoApp.showTasks();
    console.log(jsTodoApp.tasks);
  });
});

var jsTodoApp = {
  tasks: [],

  createTask: function (description) {
    var task = {
      'description': description,
      createdAt: (new Date()).toString()
    };

    this.tasks.push(task);
    return task;
  },

  showTasks: function () {
    var task_format = $('#task_template').html();
    var task_html = _.template(task_format);

    _.each(this.tasks, function (task) {
      var html = task_html(task);
      $(html).appendTo('#tasks');
    });
  }
};


















