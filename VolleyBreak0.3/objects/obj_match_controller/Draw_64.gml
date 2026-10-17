// --- PLACAR NO TOPO ---
draw_set_color(c_black);
draw_rectangle(0, 0, 480, 28, false);

draw_set_color(c_white);
draw_text(10, 6, "NOSSO COLÉGIO: " + string(score_home));
draw_text(340, 6, "RIVAIS: " + string(score_away));

// Barra de Mensagem Central
draw_set_color(c_yellow);
draw_text(10, 32, status_message);

// --- BARRA DE TEMPO DE REAÇÃO DA JOGADA ---
if (match_state != MATCH_STATE.WAITING_SERVE && match_state != MATCH_STATE.POINT_SCORED) {
    var _bar_w = (timer / timer_max) * 460;
    draw_set_color(c_red);
    draw_rectangle(10, 200, 470, 205, false);
    draw_set_color(c_yellow);
    draw_rectangle(10, 200, 10 + _bar_w, 205, false);
}

// --- HUD DOS 3 BOTÕES DE AÇÃO ---
if (match_state == MATCH_STATE.RECEIVE) {
    draw_btn(10, 212, 150, 262, "[← / 1] PASSE NORMAL", "Precisao: 85%", c_navy);
    draw_btn(165, 212, 315, 262, "[↑ / 2] PASSE ESPECIAL", "Gasta: 15 Stamina", c_maroon);
    // Alterado de c_darkgray para c_dkgray:
    draw_btn(330, 212, 470, 262, "[→ / 3] PASSE DIRETO", "Pula Levantador", c_dkgray); 
}
else if (match_state == MATCH_STATE.SET) {
    draw_btn(10, 212, 150, 262, "[← / 1] LEV. ALTO", "Padrao Seguro", c_navy);
    draw_btn(165, 212, 315, 262, "[↑ / 2] CHUTADA", "Ataque Veloz", c_purple);
    draw_btn(330, 212, 470, 262, "[→ / 3] BACKSET", "Bola Invertida", c_teal);
}
else if (match_state == MATCH_STATE.ATTACK) {
    draw_btn(10, 212, 150, 262, "[← / 1] DIAGONAL", "Corte Forte", c_navy);
    draw_btn(165, 212, 315, 262, "[↑ / 2] LARGADA", "Engana Bloqueio", c_olive);
    draw_btn(330, 212, 470, 262, "[→ / 3] SUPER CORTE", "Gasta: 25 Stamina", c_red);
}

// Função utilitária de desenho dos botões
function draw_btn(_x1, _y1, _x2, _y2, _title, _sub, _color) {
    draw_set_color(_color);
    draw_rectangle(_x1, _y1, _x2, _y2, false);
    draw_set_color(c_white);
    draw_rectangle(_x1, _y1, _x2, _y2, true);
    draw_text_transformed(_x1 + 4, _y1 + 4, _title, 0.8, 0.8, 0);
    draw_set_color(c_ltgray);
    draw_text_transformed(_x1 + 4, _y1 + 28, _sub, 0.7, 0.7, 0);
}