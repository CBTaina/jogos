target_x = 360;
target_y = 120;

// Variáveis para trajetória Parabólica
start_x = x;
start_y = y;
arc_height = 0;
progress = 1.0; // 0.0 = inicio do movimento, 1.0 = chegou ao destino
move_speed = 0.04;

/// @function launch_to(_tx, _ty, _height, _speed)
launch_to = function(_tx, _ty, _height, _speed) {
    start_x = x;
    start_y = y;
    target_x = _tx;
    target_y = _ty;
    arc_height = _height;
    move_speed = _speed;
    progress = 0.0;
};