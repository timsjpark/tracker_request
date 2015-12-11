$(".individual-info-panel").html("<%= escape_javascript(render("story_indiv")) %>")

$(".individual-info-panel").show()
$(".info-individual-loading").hide()
