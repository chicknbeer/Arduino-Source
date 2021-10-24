/*  Scale Brightness (x64 AVX2)
 *
 *  From: https://github.com/PokemonAutomation/Arduino-Source
 *
 */

#ifndef PokemonAutomation_Kernels_ImageScaleBrightness_x64_AVX2_H
#define PokemonAutomation_Kernels_ImageScaleBrightness_x64_AVX2_H

#include <stdint.h>
#include <cstddef>

namespace PokemonAutomation{
namespace Kernels{


void scale_brightness_x64_AVX2(
    size_t width, size_t height,
    uint32_t* image, size_t bytes_per_row,
    float scaleR, float scaleG, float scaleB
);



}
}
#endif
