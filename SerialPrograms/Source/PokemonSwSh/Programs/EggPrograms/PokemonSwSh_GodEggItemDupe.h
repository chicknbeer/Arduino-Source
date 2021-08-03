/*  God Egg Item Duplication
 *
 *  From: https://github.com/PokemonAutomation/Arduino-Source
 *
 */

#ifndef PokemonAutomation_PokemonSwSh_GodEggItemDupe_H
#define PokemonAutomation_PokemonSwSh_GodEggItemDupe_H

#include "CommonFramework/Options/BooleanCheckBox.h"
#include "CommonFramework/Options/SimpleInteger.h"
#include "NintendoSwitch/Options/StartInGripMenu.h"
#include "NintendoSwitch/Framework/SingleSwitchProgram.h"
#include "PokemonSwSh_EggHelpers.h"

namespace PokemonAutomation{
namespace NintendoSwitch{
namespace PokemonSwSh{


class GodEggItemDupe_Descriptor : public RunnableSwitchProgramDescriptor{
public:
    GodEggItemDupe_Descriptor();
};



class GodEggItemDupe : public SingleSwitchProgramInstance{
public:
    GodEggItemDupe(const GodEggItemDupe_Descriptor& descriptor);

    void collect_godegg(const BotBaseContext& context, uint8_t party_slot, bool map_to_pokemon, bool pokemon_to_map) const;
    void run_program(SingleSwitchProgramEnvironment& env, uint16_t attempts) const;
    virtual void program(SingleSwitchProgramEnvironment& env) override;

private:
    StartInGripOrGame START_IN_GRIP_MENU;
    SimpleInteger<uint16_t> MAX_FETCH_ATTEMPTS;
    SimpleInteger<uint8_t> PARTY_ROUND_ROBIN;
    BooleanCheckBox DETACH_BEFORE_RELEASE;
};


}
}
}
#endif
