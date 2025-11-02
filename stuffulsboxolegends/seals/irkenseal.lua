SMODS.Seal {
    key = 'irkenseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            retrig_n = 1,
        }
    },
    badge_colour = HEX('8A2BE2'),
   loc_txt = {
        name = 'Irken Seal',
        label = 'Irken Seal',
        text = {
        [1] = '{C:attention}Retriggers held in hand{}',
        [2] = 'card effects an extra time'
        
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.hand then
            repetition = true
        end
        if context.cardarea == G.hand and context.repetition then
                return{repetitions = card.ability.seal.extra.retrig_n}
        end
    end
}