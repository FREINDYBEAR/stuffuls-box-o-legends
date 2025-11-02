SMODS.Joker{ --Poop Dawg
    key = "poopdawg",
    config = {
        extra = {
            repetitions = 3
        }
    },
    loc_txt = {
        ['name'] = 'Poop Dawg',
        ['text'] = {
            [1] = '{C:attention}Retrigger{} all cards with',
            [2] = '{C:attention}Bonus{} or {C:attention}Mult{} {C:enhanced}Enhancements{} 3 times'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["stuffuls_stuffuls_jokers"] = true },
    soul_pos = {
        x = 3,
        y = 4
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_bonus"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_bonus\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["m_mult"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_mult\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (SMODS.get_enhancements(context.other_card)["m_bonus"] == true or SMODS.get_enhancements(context.other_card)["m_mult"] == true) then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}