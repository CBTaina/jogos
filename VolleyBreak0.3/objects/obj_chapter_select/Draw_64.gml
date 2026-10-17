display_set_gui_size(480, 270);

draw_set_color(c_black);
draw_set_alpha(0.85);
draw_rectangle(0, 0, 480, 270, false);
draw_set_alpha(1.0);

// Título da Galeria
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_yellow);
draw_text_transformed(240, 15, "MODO HISTÓRIA - CAPÍTULOS", 0.9, 0.9, 0);

// --- CARD CAPÍTULO 1 ---
var _c1_x = 40, _c1_y = 60, _cw = 180, _ch = 150;
draw_set_color((chapter_index == 0) ? c_navy : c_black);
draw_rectangle(_c1_x, _c1_y, _c1_x + _cw, _c1_y + _ch, false);

draw_set_color((chapter_index == 0) ? c_yellow : c_dkgray);
draw_rectangle(_c1_x, _c1_y, _c1_x + _cw, _c1_y + _ch, true);

draw_set_color(c_white);
draw_text_transformed(_c1_x + (_cw/2), _c1_y + 15, "CAPÍTULO 1", 0.85, 0.85, 0);
draw_set_color(c_ltgray);
draw_text_transformed(_c1_x + (_cw/2), _c1_y + 35, "\"A Reconstrucao\"", 0.65, 0.65, 0);
draw_set_color(c_lime);
draw_text_transformed(_c1_x + (_cw/2), _c1_y + 120, "DISPONÍVEL", 0.7, 0.7, 0);

// --- CARD CAPÍTULO 2 (BLOQUEADO) ---
var _c2_x = 260, _c2_y = 60;
draw_set_color((chapter_index == 1) ? c_maroon : c_black);
draw_rectangle(_c2_x, _c2_y, _c2_x + _cw, _c2_y + _ch, false);

draw_set_color((chapter_index == 1) ? c_red : c_dkgray);
draw_rectangle(_c2_x, _c2_y, _c2_x + _cw, _c2_y + _ch, true);

draw_set_color(c_gray);
draw_text_transformed(_c2_x + (_cw/2), _c2_y + 15, "CAPÍTULO 2", 0.85, 0.85, 0);
draw_text_transformed(_c2_x + (_cw/2), _c2_y + 35, "\"Em Breve\"", 0.65, 0.65, 0);
draw_set_color(c_red);
draw_text_transformed(_c2_x + (_cw/2), _c2_y + 120, "🔒 BLOQUEADO", 0.7, 0.7, 0);

// Rodapé explicativo
draw_set_color(c_gray);
draw_text_transformed(240, 235, "Rejogar um capitulo permite ver novas escolhas sem apagar seu Save oficial.", 0.55, 0.55, 0);

draw_set_halign(fa_left);