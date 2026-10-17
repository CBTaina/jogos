// Carrega a lista de falas e escolhas
story_nodes = get_chapter_1_dialogues();
current_node = 0;

// Efeito de digitação suave
text_progress = 0;
text_speed = 0.6;

// Controle de Seleção de Escolhas
choice_index = 0;
is_waiting_choice = false;

// Transição
is_ending = false;