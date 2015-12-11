$(".individual-info-panel").html("<%= escape_javascript(render("pull_request_indiv")) %>")

$(".individual-info-panel").show()
$(".info-individual-loading").hide()
