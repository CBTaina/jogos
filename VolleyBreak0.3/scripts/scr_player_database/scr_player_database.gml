/// @description Banco de Dados Global dos Atletas do Jogo
function init_character_database() {
    global.character_database = {
        
        // --- LIBEROS / PASSADORES ---
        renan: new PlayerData("renan", "Renan Silva", "Líbero", 60, 85, 100),
        bruno: new PlayerData("bruno", "Bruno Costa", "Líbero", 80, 70, 110),
        yuji:  new PlayerData("yuji", "Yuji Sato", "Líbero", 50, 95, 90),

        // --- LEVANTADORES ---
        kaio:    new PlayerData("kaio", "Kaio Souza", "Levantador", 50, 90, 100),
        biel:    new PlayerData("biel", "Gabriel Mendes", "Levantador", 75, 75, 95),
        takeshi: new PlayerData("takeshi", "Takeshi Mori", "Levantador", 60, 98, 105),

        // --- PONTEIROS / ATACANTES ---
        leo:   new PlayerData("leo", "Léo Viana", "Atacante", 90, 70, 100),
        lucas: new PlayerData("lucas", "Lucas Ferraz", "Atacante", 65, 92, 90),
        diego: new PlayerData("diego", "Diego Ramos", "Atacante", 98, 80, 120)
    };
}