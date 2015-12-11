$(".project-stories").html("<%= escape_javascript(render("project_stories")) %>")
$(".current-project").html("<%= escape_javascript(render("current_project")) %>")

$(".current-project").show()
$(".project-stories").show()
$(".current-project-loading").hide()
$(".project-story-loading").hide()
