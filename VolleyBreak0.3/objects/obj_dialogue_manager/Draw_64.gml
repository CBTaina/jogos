display_set_gui_size(480, 270);

var _node = story_nodes[current_node];

// 1. DESENHA O CENÁRIO DE FUNDO AUTOMÁTICO
if (sprite_exists(_node.bg)) {
    draw_sprite_stretched(_node.bg, 0, 0, 0, 480, 270);
} else {
    draw_set_color(c_dkgray);
    draw_rectangle(0, 0, 480, 270, false); // Fundo reserva escuro
}

// 2. CAIXA DE DIÁLOGO BASE (ESTILO STARDEW VALLEY)
var _box_x = 20, _box_y = 180, _box_w = 440, _box_h = 80;

// Moldura do Texto (Esquerda)
draw_set_color(c_maroon);
draw_rectangle(_box_x, _box_y, _box_x + 320, _box_y + _box_h, false);
draw_set_color(c_orange);
draw_rectangle(_box_x, _box_y, _box_x + 320, _box_y + _box_h, true);

// Moldura do Retrato (Direita)
var _port_x = _box_x + 330;
draw_set_color(c_maroon);
draw_rectangle(_port_x, _box_y, _box_x + _box_w, _box_y + _box_h, false);
draw_set_color(c_orange);
draw_rectangle(_port_x, _box_y, _box_x + _box_w, _box_y + _box_h, true);

// 3. DESENHA O RETRATO 64x64 AUTOMÁTICO NA MOLDURA
if (sprite_exists(_node.portrait)) {
    draw_sprite_ext(_node.portrait, 0, _port_x + 23, _box_y + 5, 1, 1, 0, c_white, 1.0);
} else {
    // Retrato temporário amarelado enquanto você gera os sprites
    draw_set_color(c_yellow);
    draw_rectangle(_port_x + 23, _box_y + 5, _port_x + 87, _box_y + 69, false);
}

// Placa com o Nome de quem fala
draw_set_color(c_black);
draw_rectangle(_port_x + 5, _box_y + 60, _box_x + _box_w - 5, _box_y + 75, false);

draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(_port_x + 55, _box_y + 67, _node.speaker, 0.65, 0.65, 0);

// 4. TEXTO DA FALA
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

var _printed = string_copy(_node.text, 1, floor(text_progress));
draw_text_ext_transformed(_box_x + 12, _box_y + 10, _printed, 14, 300, 0.7, 0.7, 0);