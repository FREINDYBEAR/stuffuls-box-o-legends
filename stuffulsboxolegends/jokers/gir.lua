SMODS.Joker{ --GIR
    key = "gir",
    config = {
        extra = {
            
            odds = 3,
            n = 0,
            y = 0
        }
    },
    loc_txt = {
        ['name'] = 'GIR',
        ['text'] = {
            [1] = '{C:green}1 in 3{} chance of granting a {C:dark_edition}Negative{}',
            [2] = '{C:cry_code}Code{} card when opening a booster pack'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 2
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
        x = 7,
        y = 2
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    calculate = function(self, card, context)
        if context.open_booster  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_d146b55b', 1, card.ability.extra.odds, 'j_stuffuls_gir', false) then
              SMODS.calculate_effect({
    func = function()
    for i = 1, 1 do
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
            play_sound('timpani')
            SMODS.add_card({ set = 'Code', edition = 'e_negative', soulable = true, })                            
            card:juice_up(0.3, 0.5)
            return true
        end
        }))
    end
    delay(0.6)

                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                  end}, card)
          end
            end
        end
    end
}