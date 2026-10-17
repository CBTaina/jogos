display_set_gui_size(480, 270);

// Desenha a imagem de fundo sempre no início
draw_sprite_stretched(spr_title_background, 0, 0, 0, 480, 270);

// --- TELA 1: PRESSIONE QUALQUER TECLA ---
if (current_state == TITLE_STATE.PRESS_ANY_KEY) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Sombra do Texto
    draw_set_color(c_black);
    draw_set_alpha(blink_alpha * 0.8);
    draw_text_transformed(241, 246, "- PRESSIONE QUALQUER TECLA -", 0.8, 0.8, 0);

    // Texto Amarelo
    draw_set_color(c_yellow);
    draw_set_alpha(blink_alpha);
    draw_text_transformed(240, 245, "- PRESSIONE QUALQUER TECLA -", 0.8, 0.8, 0);
    draw_set_alpha(1.0);
}

// --- TELA 2: MENU PRINCIPAL FLUTUANTE ---
if (current_state == TITLE_STATE.MAIN_MENU) {
    var _box_x = 140, _box_y = 80, _box_w = 200, _box_h = 130;

    // Fundo do caixa
    draw_set_color(c_black);
    draw_set_alpha(0.85);
    draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, false);
    
    draw_set_color(c_yellow);
    draw_set_alpha(1.0);
    draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, true);

    // Título do Menu
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_text_transformed(_box_x + (_box_w / 2), _box_y + 10, "MENU PRINCIPAL", 0.85, 0.85, 0);

    // Lista de opções
    var _start_y = _box_y + 35;
    for (var i = 0; i < array_length(menu_options); i++) {
        var _opt_y = _start_y + (i * 28);
        
        if (i == menu_index) {
            draw_set_color(c_yellow);
            draw_rectangle(_box_x + 10, _opt_y, _box_x + _box_w - 10, _opt_y + 22, false);
            draw_set_color(c_black);
            draw_text_transformed(_box_x + (_box_w / 2), _opt_y + 4, "> " + menu_options[i] + " <", 0.75, 0.75, 0);
        } else {
            draw_set_color(c_white);
            draw_text_transformed(_box_x + (_box_w / 2), _opt_y + 4, menu_options[i], 0.75, 0.75, 0);
        }
    }
}

// --- TELA 3: CONFIRMAÇÃO DE NOVO JOGO ---
if (current_state == TITLE_STATE.CONFIRM_NEW_GAME) {
    var _box_x = 90, _box_y = 60, _box_w = 300, _box_h = 140;

    draw_set_color(c_maroon);
    draw_set_alpha(0.95);
    draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, false);
    
    draw_set_color(c_white);
    draw_set_alpha(1.0);
    draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, true);

    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_text_transformed(240, _box_y + 10, "ATENÇÃO!", 0.9, 0.9, 0);
    
    draw_set_color(c_yellow);
    draw_text_transformed(240, _box_y + 32, "Iniciar um Novo Jogo ira apagar\ntodo o seu progresso anterior!", 0.65, 0.65, 0);

    // Botão SIM
    if (confirm_index == 0) {
        draw_set_color(c_red);
        draw_rectangle(130, 160, 220, 185, false);
        draw_set_color(c_white);
        draw_rectangle(130, 160, 220, 185, true);
        draw_text_transformed(175, 166, "SIM", 0.8, 0.8, 0);
    } else {
        draw_set_color(c_black);
        draw_rectangle(130, 160, 220, 185, false);
        draw_set_color(c_gray);
        draw_text_transformed(175, 166, "SIM", 0.8, 0.8, 0);
    }

    // Botão NÃO
    if (confirm_index == 1) {
        draw_set_color(c_lime);
        draw_rectangle(260, 160, 350, 185, false);
        draw_set_color(c_black);
        draw_text_transformed(305, 166, "NÃO", 0.8, 0.8, 0);
    } else {
        draw_set_color(c_black);
        draw_rectangle(260, 160, 350, 185, false);
        draw_set_color(c_gray);
        draw_text_transformed(305, 166, "NÃO", 0.8, 0.8, 0);
    }
}

// --- TELA 4: CAMPO DE NICKNAME / PERFIL ---
if (current_state == TITLE_STATE.INPUT_NAME) {
    var _box_x = 40, _box_y = 15, _box_w = 400, _box_h = 240;

    draw_set_color(c_black);
    draw_set_alpha(0.92);
    draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, false);
    
    draw_set_color(c_yellow);
    draw_set_alpha(1.0);
    draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, true);

    // Título
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_text_transformed(240, _box_y + 8, "COMO DEVO CHAMAR VOCÊ?", 0.85, 0.85, 0);

    // Campo do Nickname
    draw_set_color(c_dkgray);
    draw_rectangle(80, _box_y + 28, 400, _box_y + 55, false);
    draw_set_color(c_white);
    draw_rectangle(80, _box_y + 28, 400, _box_y + 55, true);

    var _cursor = (blink_alpha > 0.5) ? "|" : "";
    draw_set_valign(fa_middle);
    draw_set_color(c_yellow);
    draw_text_transformed(240, _box_y + 42, player_nickname + _cursor, 0.85, 0.85, 0);

    // Tamanho do texto
    var _len = string_length(player_nickname);
    var _valid = (_len >= 3 && _len <= 25);
    draw_set_valign(fa_top);
    draw_set_color(_valid ? c_lime : c_orange);
    draw_text_transformed(240, _box_y + 58, string(_len) + "/25 caracteres (Minimo 3)", 0.6, 0.6, 0);

    // Teclado Virtual On-Screen
    for (var _r = 0; _r < 3; _r++) {
        for (var _c = 0; _c < 10; _c++) {
            var _kx = 90 + (_c * 30);
            var _ky = 90 + (_r * 26);
            var _char = vk_layout[_r][_c];

            if (_c == vk_grid_x && _r == vk_grid_y) {
                draw_set_color(c_yellow);
                draw_rectangle(_kx, _ky, _kx + 28, _ky + 24, false);
                draw_set_color(c_black);
            } else {
                draw_set_color(c_dkgray);
                draw_rectangle(_kx, _ky, _kx + 28, _ky + 24, false);
                draw_set_color(c_white);
                draw_rectangle(_kx, _ky, _kx + 28, _ky + 24, true);
            }

            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text_transformed(_kx + 14, _ky + 12, _char, 0.75, 0.75, 0);
        }
    }

    // Botão Continuar
    draw_set_valign(fa_middle);
    if (_valid) {
        draw_set_color(c_lime);
        draw_rectangle(160, 200, 320, 225, false);
        draw_set_color(c_black);
        draw_text_transformed(240, 212, "CONTINUAR", 0.8, 0.8, 0);
    } else {
        draw_set_color(c_dkgray);
        draw_rectangle(160, 200, 320, 225, false);
        draw_set_color(c_gray);
        draw_rectangle(160, 200, 320, 225, true);
        draw_text_transformed(240, 212, "MIN. 3 LETRAS", 0.7, 0.7, 0);
    }
}

// Reseta propriedades globais de desenho
draw_set_alpha(1.0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);