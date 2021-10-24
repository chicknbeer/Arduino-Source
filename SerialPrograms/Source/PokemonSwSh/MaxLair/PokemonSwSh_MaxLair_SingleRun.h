/*  Max Lair (Single Adventure Run)
 *
 *  From: https://github.com/PokemonAutomation/Arduino-Source
 *
 */

#ifndef PokemonAutomation_PokemonSwSh_MaxLair_SingleRun_H
#define PokemonAutomation_PokemonSwSh_MaxLair_SingleRun_H

#include "CommonFramework/Options/EnumDropdownOption.h"
#include "CommonFramework/Notifications/EventNotificationsTable.h"
#include "CommonFramework/OCR/LanguageOptionOCR.h"
#include "NintendoSwitch/Options/StartInGripMenuOption.h"
#include "NintendoSwitch/Framework/MultiSwitchProgram.h"
#include "Framework/PokemonSwSh_MaxLair_Options.h"

namespace PokemonAutomation{
namespace NintendoSwitch{
namespace PokemonSwSh{
using namespace Pokemon;


class MaxLairSingleRun_Descriptor : public MultiSwitchProgramDescriptor{
public:
    MaxLairSingleRun_Descriptor();
};


class MaxLairSingleRun : public MultiSwitchProgramInstance{
public:
    MaxLairSingleRun(const MaxLairSingleRun_Descriptor& descriptor);

    virtual QString check_validity() const override;

    virtual std::unique_ptr<StatsTracker> make_stats() const override;
    virtual void program(MultiSwitchProgramEnvironment& env) override;


private:
    StartInGripOrGameOption START_IN_GRIP_MENU;

    EnumDropdownOption HOST_SWITCH;
    EnumDropdownOption BOSS_SLOT;

    LanguageSet m_languages;
    MaxLairInternal::MaxLairConsoleOptions PLAYER0;
    MaxLairInternal::MaxLairConsoleOptions PLAYER1;
    MaxLairInternal::MaxLairConsoleOptions PLAYER2;
    MaxLairInternal::MaxLairConsoleOptions PLAYER3;

    MaxLairInternal::HostingSettings HOSTING;

    EventNotificationOption NOTIFICATION_NO_SHINY;
    EventNotificationOption NOTIFICATION_SHINY;
    EventNotificationsOption NOTIFICATIONS;
};



}
}
}
#endif
