// Sombra da bola no chão
draw_set_color(c_black);
draw_set_alpha(0.3);
draw_ellipse(x - 5, target_y - 2, x + 5, target_y + 2, false);
draw_set_alpha(1.0);

// Desenho da Bola
draw_set_color(c_yellow);
draw_circle(x, y, 5, false);
draw_set_color(c_white);
draw_circle(x, y, 5, true);