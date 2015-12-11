$(".project-count").html("<%= escape_javascript(render("project_count")) %>")
$(".project-list").html("<%= escape_javascript(render("project_list")) %>")
$(".project-list-loading").hide()
$(".project-count-loading").hide()
$(".project-list").show()
$(".project-count").show()

