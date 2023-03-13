var width = display_get_gui_width();
var height = display_get_gui_height();

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(16, 16, "Tree preview:\n\n" + tree.to_string());

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(width / 2, height / 2, "Open window \"Otput\",\n and see examples in `obj_tests`");
