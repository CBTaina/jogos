// --- ESTADOS DA PARTIDA DE VÔLEI (DEFINITIVO) ---
enum MATCH_STATE {
    WAITING_SERVE,  // Aguardando autorização/saque
    RECEIVE,        // Janela de recepção / passe
    SET,            // Janela de levantamento
    ATTACK,         // Janela de ataque / corte
    POINT_SCORED    // Ponto finalizado
}

// --- TIPO DE AÇÃO DO BOTÃO ---
enum ACTION_TYPE {
    NORMAL,
    SKILL,
    TACTICAL
}