Config = {}

Config.Interaction = {
    barbielyftupp = {
        src = {
            animDictionary = "anim@heists@box_carry@",
            animationName = "idle",
            blendInSpeed = 8.0,
            blendOutSpeed = 8.0,
            duration = -1,
            flag = 50
        },
        dest = {
            animDictionary = "amb@code_human_in_car_idles@generic@ps@base",
            animationName = "base",
            blendInSpeed = 8.0,
            blendOutSpeed = -8.0,
            duration = -1,
            flag = 33,
            lockY = 40
        }
    },
    carry = {
        src = {
            animDictionary = 'missfinale_c2mcs_1',
            animationName = 'fin_c2_mcs_1_camman',
            blendInSpeed = 8.0,
            blendOutSpeed = -8.0,
            duration = -1,
            flag = 49
        },
        dest = {
            animDictionary = 'nm',
            animationName = 'firemans_carry',
            blendInSpeed = 8.0,
            blendOutSpeed = -8.0,
            duration = -1,
            flag = 33,
            lockY = false
        }
    },
    piggyback = {
        src = {
            animDictionary = 'anim@arena@celeb@flat@paired@no_props@',
            animationName = 'piggyback_c_player_a',
            blendInSpeed = 8.0,
            blendOutSpeed = -8.0,
            duration = 100000,
            flag = 49
        },
        dest = {
            animDictionary = 'anim@arena@celeb@flat@paired@no_props@',
            animationName = 'piggyback_c_player_b',
            blendInSpeed = 8.0,
            blendOutSpeed = -8.0,
            duration = 100000,
            flag = 33,
            lockY = false
        }
    }
}