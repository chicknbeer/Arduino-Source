/*  Misc. Routines
 *
 *  From: https://github.com/PokemonAutomation/Arduino-Source
 *
 */

#ifndef PokemonAutomation_PokemonSwSh_Commands_Misc_H
#define PokemonAutomation_PokemonSwSh_Commands_Misc_H

#include "Common/PokemonSwSh/PokemonSwSh_Protocol_Misc.h"
#include "ClientSource/Connection/BotBase.h"

namespace PokemonAutomation{
namespace NintendoSwitch{


void mash_A         (const BotBaseContext& context, uint16_t ticks);
void IoA_backout    (const BotBaseContext& context, uint16_t pokemon_to_menu_delay);


class DeviceRequest_controller_state : public BotBaseRequest{
public:
    pabb_controller_state params;
    DeviceRequest_controller_state(
        Button button,
        DpadPosition dpad,
        uint8_t left_joystick_x,
        uint8_t left_joystick_y,
        uint8_t right_joystick_x,
        uint8_t right_joystick_y,
        uint8_t ticks
    )
        : BotBaseRequest(true)
    {
        params.seqnum = 0;
        params.button = button;
        params.dpad = dpad;
        params.left_joystick_x = left_joystick_x;
        params.left_joystick_y = left_joystick_y;
        params.right_joystick_x = right_joystick_x;
        params.right_joystick_y = right_joystick_y;
        params.ticks = ticks;
    }
    virtual BotBaseMessage message() const override{
        return BotBaseMessage(PABB_MSG_CONTROLLER_STATE, params);
    }
};
class DeviceRequest_mash_A : public BotBaseRequest{
public:
    pabb_mashA params;
    DeviceRequest_mash_A(uint16_t ticks)
        : BotBaseRequest(true)
    {
        params.seqnum = 0;
        params.ticks = ticks;
    }
    virtual BotBaseMessage message() const override{
        return BotBaseMessage(PABB_MSG_COMMAND_MASH_A, params);
    }
};
class DeviceRequest_IoA_backout : public BotBaseRequest{
public:
    pabb_IoA_backout params;
    DeviceRequest_IoA_backout(uint16_t pokemon_to_menu_delay)
        : BotBaseRequest(true)
    {
        params.seqnum = 0;
        params.pokemon_to_menu_delay = pokemon_to_menu_delay;
    }
    virtual BotBaseMessage message() const override{
        return BotBaseMessage(PABB_MSG_COMMAND_IOA_BACKOUT, params);
    }
};



}
}
#endif
