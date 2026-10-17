// --- RENDERIZAÇÃO DA QUADRA ---
// Piso da Quadra
draw_set_color(c_dkgray);
draw_rectangle(30, 195, 450, 225, false);

// Linha Central / Rede
draw_set_color(c_white);
draw_line_width(pos_rede.x, pos_rede.y, pos_rede.x, 215, 3);

// --- POSIÇÕES DO TRIO EM QUADRA ---
// Passador (P1)
draw_set_color(c_blue);
draw_rectangle(pos_passador.x - 12, pos_passador.y - 20, pos_passador.x + 12, pos_passador.y + 15, false);
draw_set_color(c_white);
draw_text_transformed(pos_passador.x - 10, pos_passador.y - 32, "REC", 0.7, 0.7, 0);

// Levantador (P2)
draw_set_color(c_green);
draw_rectangle(pos_levantador.x - 12, pos_levantador.y - 20, pos_levantador.x + 12, pos_levantador.y + 15, false);
draw_set_color(c_white);
draw_text_transformed(pos_levantador.x - 10, pos_levantador.y - 32, "LEV", 0.7, 0.7, 0);

// Atacante (P3)
draw_set_color(c_red);
draw_rectangle(pos_atacante.x - 12, pos_atacante.y - 20, pos_atacante.x + 12, pos_atacante.y + 15, false);
draw_set_color(c_white);
draw_text_transformed(pos_atacante.x - 10, pos_atacante.y - 32, "ATQ", 0.7, 0.7, 0);