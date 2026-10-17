if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))) {
    chapter_index = 0;
}
if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))) {
    chapter_index = 1;
}

// Confirmação
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
    if (chapter_index == 0) {
        // Carrega a cena de diálogo do Capítulo 1
        room_goto(rm_story_chapter_1);
    }
}