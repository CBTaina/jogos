if (progress < 1.0) {
    progress += move_speed;
    progress = clamp(progress, 0.0, 1.0);
    
    // Interpolação linear da posição X e Y
    var _current_x = lerp(start_x, target_x, progress);
    var _current_y = lerp(start_y, target_y, progress);
    
    // Adiciona o arco em Y usando função seno
    var _arc = sin(progress * pi) * arc_height;
    
    x = _current_x;
    y = _current_y - _arc;
}