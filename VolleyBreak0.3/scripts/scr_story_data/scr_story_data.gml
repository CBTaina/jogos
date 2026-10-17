/// @description Estrutura de Dados e Diálogos do Modo História

/// @function get_chapter_1_dialogues()
/// @description Retorna o roteiro completo do Capítulo 1 com suporte a portraits, backgrounds e escolhas.
function get_chapter_1_dialogues() {
    
    // 1. GARANTE QUE AS DUPLAS CANDIDATAS EXISTAM NO SAVE (Executa antes de ler as variáveis)
    if (!variable_struct_exists(global.player_save, "cap1_candidates")) {
        var _liberos   = ["renan", "bruno"];
        var _ponteiros = ["leo", "lucas"];
        
        // Sorteia a ordem das duplas para este save específico
        array_shuffle(_liberos);
        array_shuffle(_ponteiros);
        
        global.player_save.cap1_candidates = {
            libero_1: _liberos[0],
            libero_2: _liberos[1],
            ponteiro_1: _ponteiros[0],
            ponteiro_2: _ponteiros[1]
        };
        save_game_data(global.player_save);
    }
    
    // 2. LEITURA SEGURA DOS DADOS DO JOGADOR E CANDIDATOS
    var _c = global.player_save.cap1_candidates;
    var _trainer = global.player_save.player_name;
    
    // Nomes amigáveis para exibição nos botões do Amor Doce
    var _lib1_name = (_c.libero_1 == "renan") ? "Renan" : "Bruno";
    var _lib2_name = (_c.libero_2 == "renan") ? "Renan" : "Bruno";
    var _pon1_name = (_c.ponteiro_1 == "leo") ? "Léo" : "Lucas";
    var _pon2_name = (_c.ponteiro_2 == "leo") ? "Léo" : "Lucas";

    // 3. ESTRUTURA COMPLETA DA NARRATIVA DO CAPÍTULO 1
    return [
        // --- CENA 1: Entrada do Ginásio ---
        { 
            bg: spr_bg_gym_entrance, 
            speaker: "Takeshi", 
            portrait: spr_portrait_takeshi, 
            text: "Treinador " + _trainer + "... voce veio mesmo? A quadra esta abandonada ha meses. Os outros desistiram.", 
            choices: [] 
        },
        { 
            bg: spr_bg_gym_entrance, 
            speaker: _trainer, 
            portrait: spr_portrait_player, 
            text: "Eu assumi a equipe para reconstruir nosso time do zero, Takeshi. Onde estao os atletas que ainda frequentam a escola?", 
            choices: [] 
        },
        { 
            bg: spr_bg_gym_entrance, 
            speaker: "Takeshi", 
            portrait: spr_portrait_takeshi, 
            text: "A maioria se afastou, mas ainda temos dois passadores e dois atacantes conversando pelo corredor.", 
            choices: [] 
        },

        // --- CENA 2: Corredor do Colégio (Escolha do Passador) ---
        { 
            bg: spr_bg_school_hallway, 
            speaker: "Takeshi", 
            portrait: spr_portrait_takeshi, 
            text: "Precisamos montar o trio inicial. Qual dos dois passadores voce quer convocar primeiro para o nosso treino?", 
            choices: ["Convocar " + _lib1_name, "Convocar " + _lib2_name] 
        },
        { 
            bg: spr_bg_school_hallway, 
            speaker: "Takeshi", 
            portrait: spr_portrait_takeshi, 
            text: "Excelente escolha! Ele tem muito potencial e com certeza vai se motivar com a sua chegada.", 
            choices: [] 
        },

        // --- CENA 3: Pátio da Escola (Escolha do Atacante) ---
        { 
            bg: spr_bg_courtyard, 
            speaker: "Takeshi", 
            portrait: spr_portrait_takeshi, 
            text: "Agora, para a posicao de ponteiro e principal atacante do nosso time, quem vamos chamar?", 
            choices: ["Convocar " + _pon1_name, "Convocar " + _pon2_name] 
        },
        { 
            bg: spr_bg_courtyard, 
            speaker: _trainer, 
            portrait: spr_portrait_player, 
            text: "Perfeito. Com isso, nosso trio base esta oficialmente formado para o primeiro teste em quadra.", 
            choices: [] 
        },

        // --- CENA 4: Interior do Ginásio (Clímax e Misterioso) ---
        { 
            bg: spr_bg_gym_inside, 
            speaker: "Takeshi", 
            portrait: spr_portrait_takeshi, 
            text: "Consegui marcar um treino contra um time local para testar nossa sintonia... Espera, quem e aquele cara ali?", 
            choices: [] 
        },
        { 
            bg: spr_bg_gym_inside, 
            speaker: "Misterioso", 
            portrait: spr_portrait_mysterio, 
            text: "Voces realmente acham que um trio improvisado e um treinador novato tem alguma chance no campeonato escolar?", 
            choices: [] 
        },
        { 
            bg: spr_bg_gym_inside, 
            speaker: "Takeshi", 
            portrait: spr_portrait_takeshi, 
            text: "Voce... O que esta fazendo aqui?! Pensei que tinha se transferido para a escola rival!", 
            choices: [] 
        },
        { 
            bg: spr_bg_gym_inside, 
            speaker: "Misterioso", 
            portrait: spr_portrait_mysterio, 
            text: "Vim garantir pessoalmente que este colégio nunca mais consiga patrocínio. Entrem em quadra se tiverem coragem!", 
            choices: [] 
        }
    ];
}