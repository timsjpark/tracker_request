$(".repo-count").html("<%= escape_javascript(render("repo_count")) %>")
$(".repo-count-loading").hide()
$(".repo-count").show()

