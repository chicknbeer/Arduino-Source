/*  Name Database
 *
 *  From: https://github.com/PokemonAutomation/Arduino-Source
 *
 */

#ifndef PokemonAutomation_PokemonBDSP_NameDatabase_H
#define PokemonAutomation_PokemonBDSP_NameDatabase_H

#include "CommonFramework/Options/StringSelectOption.h"

namespace PokemonAutomation{
namespace NintendoSwitch{
namespace PokemonBDSP{


StringSelectDatabase make_name_database(const std::vector<std::string>& slugs);
StringSelectDatabase make_name_database(const std::string& json_file_slugs);

const StringSelectDatabase& ALL_POKEMON_NAMES();




}
}
}
#endif
