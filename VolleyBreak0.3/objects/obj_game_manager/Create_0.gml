// --- CONFIGURAÇÃO INICIAL DE VÍDEO ---
init_game_display();

// Impede que o GameMaker crie duas instâncias desse gerenciador
if (instance_number(object_index) > 1) {
    instance_destroy();
}