$(document).ready(function () {

  $('.task button').on('click', function () {
    var $task = $(this).closest('.task');
    console.log('thanks for clicking', this, $task);
    $task.fadeOut(function () {
      $task.appendTo('#completed').fadeIn();
    });
  });

});
