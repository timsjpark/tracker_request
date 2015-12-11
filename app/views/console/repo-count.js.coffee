$(".repo-count").html("<%= escape_javascript(render("repo_count")) %>")
$(".repo-list").html("<%= escape_javascript(render("repo_list")) %>")
$(".repo-list-loading").hide()
$(".repo-count-loading").hide()
$(".repo-list").show()
$(".repo-count").show()

