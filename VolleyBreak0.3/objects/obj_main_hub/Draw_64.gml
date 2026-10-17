display_set_gui_size(480, 270);

// --- 1. TOPO: BARRA DE PERFIL E RECURSOS ---
draw_set_color(c_black);
draw_set_alpha(0.85);
draw_rectangle(0, 0, 480, 35, false);

draw_set_color(c_yellow);
draw_rectangle(0, 34, 480, 35, false); // Linha divisória
draw_set_alpha(1.0);

// Nome e Nível do Jogador
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text_transformed(10, 12, global.player_save.player_name, 0.8, 0.8, 0);

draw_set_color(c_lime);
draw_text_transformed(10, 24, "Nivel " + string(global.player_save.player_level), 0.65, 0.65, 0);

// Moedas (Ouro)
draw_set_color(c_yellow);
draw_text_transformed(160, 18, "$ " + string(global.player_save.coins), 0.8, 0.8, 0);

// Contador de Medalhas (Bronze, Prata, Ouro)
draw_set_color(c_orange);
draw_text_transformed(270, 18, "B:" + string(global.player_save.medals_bronze), 0.7, 0.7, 0);

draw_set_color(c_ltgray);
draw_text_transformed(330, 18, "P:" + string(global.player_save.medals_silver), 0.7, 0.7, 0);

draw_set_color(c_yellow);
draw_text_transformed(390, 18, "O:" + string(global.player_save.medals_gold), 0.7, 0.7, 0);


// --- 2. PAINEL CENTRAL: OS 3 BOTOES PRINCIPAIS ---
var _btn_w = 130, _btn_h = 135, _start_x = 25, _btn_y = 55;
var _titles = ["HISTORIA", "TEMPORADA", "LOJA"];
var _subtitles = [
    "Modo Campanha\n& Evolucao", 
    " Escalada de Ligas\n Rank Competitivo", 
    "Comprar Atletas\n & Skins de Elite"
];

for (var i = 0; i < 3; i++) {
    var _bx = _start_x + (i * 150);
    var _is_selected = (selected_index == i);

    // Cor base dos cards
    if (_is_selected) {
        draw_set_color(c_navy);
        draw_set_alpha(0.95);
        draw_rectangle(_bx, _btn_y, _bx + _btn_w, _btn_y + _btn_h, false);
        
        // Borda Amarela em Destaque
        draw_set_color(c_yellow);
        draw_rectangle(_bx, _btn_y, _bx + _btn_w, _btn_y + _btn_h, true);
        draw_rectangle(_bx + 1, _btn_y + 1, _bx + _btn_w - 1, _btn_y + _btn_h - 1, true);
    } else {
        draw_set_color(c_black);
        draw_set_alpha(0.8);
        draw_rectangle(_bx, _btn_y, _bx + _btn_w, _btn_y + _btn_h, false);
        
        draw_set_color(c_dkgray);
        draw_rectangle(_bx, _btn_y, _bx + _btn_w, _btn_y + _btn_h, true);
    }
    draw_set_alpha(1.0);

    // Títulos e Subtítulos dos Botões
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    
    draw_set_color(_is_selected ? c_yellow : c_white);
    draw_text_transformed(_bx + (_btn_w / 2), _btn_y + 12, _titles[i], 0.85, 0.85, 0);

    draw_set_color(c_ltgray);
    draw_text_transformed(_bx + (_btn_w / 2), _btn_y + 40, _subtitles[i], 0.6, 0.6, 0);

    // Destaque extra no botão Temporada (Mostra o nível da Liga Atual)
    if (i == 1) {
        var _tier_index = clamp(global.player_save.season_tier, 0, 6);
        draw_set_color(c_lime);
        draw_text_transformed(_bx + (_btn_w / 2), _btn_y + 95, "Liga Atual:\n" + tier_names[_tier_index], 0.6, 0.6, 0);
    }
}


// --- 3. RODAPÉ: INFORMAÇÃO DO PATROCINADOR & DICA ---
draw_set_color(c_black);
draw_set_alpha(0.85);
draw_rectangle(0, 210, 480, 270, false);
draw_set_alpha(1.0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(10, 218, "Reputacao do Patrocinador: " + string(global.player_save.sponsor_reputation) + "%", 0.65, 0.65, 0);

draw_set_color(c_gray);
draw_text_transformed(10, 235, "Derrotas seguidas no modo Temporada reduzem o repasse financeiro do clube.", 0.55, 0.55, 0);

draw_set_halign(fa_right);
draw_set_color(c_yellow);
draw_text_transformed(470, 245, "[Setas / WASD] Selecionar  |  [ENTER / Clique] Confirmar", 0.6, 0.6, 0);


// --- 4. MODAL DE AVISO (REQUISITO DA TEMPORADA) ---
if (show_lock_modal) {
    var _mw = 320, _mh = 140;
    var _mx1 = (480 - _mw) / 2, _my1 = (270 - _mh) / 2;

    draw_set_color(c_black);
    draw_set_alpha(0.7);
    draw_rectangle(0, 0, 480, 270, false); // Escurece o fundo

    draw_set_color(c_maroon);
    draw_set_alpha(0.95);
    draw_rectangle(_mx1, _my1, _mx1 + _mw, _my1 + _mh, false);
    
    draw_set_color(c_yellow);
    draw_set_alpha(1.0);
    draw_rectangle(_mx1, _my1, _mx1 + _mw, _my1 + _mh, true);

    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_text_transformed(240, _my1 + 15, lock_message, 0.7, 0.7, 0);

    // Botão ENTENDIDO
    draw_set_color(c_yellow);
    draw_rectangle(190, _my1 + 105, 290, _my1 + 125, false);
    draw_set_color(c_black);
    draw_set_valign(fa_middle);
    draw_text_transformed(240, _my1 + 115, "ENTENDIDO", 0.7, 0.7, 0);
}

// Reseta alinhamento
draw_set_halign(fa_left);
draw_set_valign(fa_top);