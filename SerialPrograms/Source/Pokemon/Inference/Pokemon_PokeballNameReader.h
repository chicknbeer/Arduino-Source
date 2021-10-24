/*  Pokeball Name Reader
 *
 *  From: https://github.com/PokemonAutomation/Arduino-Source
 *
 */

#ifndef PokemonAutomation_Pokemon_PokeballNameReader_H
#define PokemonAutomation_Pokemon_PokeballNameReader_H

#include <QImage>
#include "CommonFramework/Tools/Logger.h"
#include "CommonFramework/OCR/SmallDictionaryMatcher.h"

namespace PokemonAutomation{
namespace Pokemon{


class PokeballNameReader : public OCR::SmallDictionaryMatcher{
    static constexpr double MAX_LOG10P = -1.40;

public:
    PokeballNameReader();

    static PokeballNameReader& instance();

    OCR::StringMatchResult read_substring(
        Logger& logger,
        Language language,
        const QImage& image
    ) const;
};


}
}
#endif
