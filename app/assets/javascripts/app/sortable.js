var tasksOrder;

function updateProjectOrder (project_id, order) {
  $.ajax({
    type: 'POST',
    url: '/update_tasks_order/' + project_id,
    data: {
      order: order
    },
    success: function(){
      console.log('order updated');
    }
  });
}

function getOrder () {
  var projects = {};

  $('.tasks-group').each(function(){
    var node = this, tasks = [];

    $(".tasks-group-item", node).each(function(){
      tasks.push( $(this).attr('data-task')   );
    });

    projects[$(node).attr('data-project')] = tasks;
  });

  return projects;
}

$(function() {

  $.ajaxSetup({
    headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
  });

  tasksOrder = getOrder();

  $('.tasks-group').sortable({
    helper: 'clone',
    handle: '.task-item-handle',
    stop: function () {
      var order = getOrder();

      for (project_id in order) {
        if (order[project_id].join() !== tasksOrder[project_id].join()) {
          updateProjectOrder(project_id, order[project_id]);
        }
      }

      tasksOrder = order;
    }
  });
});
