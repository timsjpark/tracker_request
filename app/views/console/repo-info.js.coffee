$(".repo_branches").html("<%= escape_javascript(render("repo_branches")) %>")
$(".repo_pull_requests").html("<%= escape_javascript(render("repo_pull_requests")) %>")

$(".repo-branches").show()
$(".repo-branch-loading").hide()
$(".repo-pull-requests").show()
$(".repo-pull-request-loading").hide()
