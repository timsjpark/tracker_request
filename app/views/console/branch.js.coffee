
$(".individual-info-panel").html("<%= escape_javascript(render("branch_indiv")) %>")

$(".individual-info-panel").show()
$(".info-individual-loading").hide()
