/*  Max Lair Run Professor Swap
 *
 *  From: https://github.com/PokemonAutomation/Arduino-Source
 *
 */

#include "CommonFramework/Inference/VisualInferenceRoutines.h"
#include "CommonFramework/Inference/BlackScreenDetector.h"
#include "NintendoSwitch/Commands/NintendoSwitch_PushButtons.h"
#include "PokemonSwSh/MaxLair/Framework/PokemonSwSh_MaxLair_Options.h"
#include "PokemonSwSh/MaxLair/Inference/PokemonSwSh_MaxLair_Detect_PathSelect.h"
#include "PokemonSwSh/MaxLair/AI/PokemonSwSh_MaxLair_AI.h"
#include "PokemonSwSh_MaxLair_Run_ProfessorSwap.h"

namespace PokemonAutomation{
namespace NintendoSwitch{
namespace PokemonSwSh{
namespace MaxLairInternal{


void run_professor_swap(
    ProgramEnvironment& env,
    ConsoleHandle& console,
    GlobalStateTracker& state_tracker
){
    size_t console_index = console.index();
    GlobalState& state = state_tracker[console_index];
    size_t player_index = state.find_player_index(console_index);

    PathReader reader(console, player_index);
    reader.read_sprites(console, state, console.video().snapshot());
    reader.read_hp(console, state, console.video().snapshot());


    GlobalState inferred = state_tracker.synchronize(env, console, console_index);


    bool swap = should_swap_with_professor(console, inferred, player_index);
    if (swap){
        console.log("Choosing to swap.", "purple");
        pbf_press_button(console, BUTTON_A, 10, TICKS_PER_SECOND);
    }else{
        console.log("Choosing not to swap.", "purple");
        pbf_press_button(console, BUTTON_B, 10, TICKS_PER_SECOND);
    }
    console.botbase().wait_for_all_requests();

#if 1
    //  Wait until we exit the window.
    {
        BlackScreenDetector detector;
        int result = run_until(
            env, console,
            [&](const BotBaseContext& context){
                pbf_mash_button(context, swap ? BUTTON_A : BUTTON_B, 30 * TICKS_PER_SECOND);
            },
            { &detector }
        );
        if (result < 0){
            console.log("Timed out waiting for black screen.", Qt::red);
        }else{
            console.log("Found path screen. Reading party...");
        }
    }
#endif
    {
        PathScreenDetector detector;
        int result = wait_until(
            env, console,
            std::chrono::seconds(30),
            { &detector },
            INFERENCE_RATE
        );
        if (result < 0){
            console.log("Timed out waiting for path screen.", Qt::red);
        }else{
            console.log("Found path screen. Reading party...");
        }
    }

    env.wait_for(std::chrono::milliseconds(100));

    reader.read_sprites(console, state, console.video().snapshot());
    reader.read_hp(console, state, console.video().snapshot());
}




}
}
}
}
