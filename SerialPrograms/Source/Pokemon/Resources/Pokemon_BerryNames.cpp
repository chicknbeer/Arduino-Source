/*  Pokemon Pokeball Names
 *
 *  From: https://github.com/PokemonAutomation/Arduino-Source
 *
 */

#include "Common/Cpp/Exceptions.h"
#include "Common/Cpp/Json/JsonValue.h"
#include "Common/Cpp/Json/JsonArray.h"
#include "Common/Cpp/Json/JsonObject.h"
#include "CommonFramework/Globals.h"
#include "Pokemon_BerryNames.h"

namespace PokemonAutomation{
namespace Pokemon{


struct BerryNameDatabase{
    BerryNameDatabase();

    static const BerryNameDatabase& instance(){
        static BerryNameDatabase database;
        return database;
    }

    static const std::string NULL_SLUG;
    std::vector<std::string> ordered_list;
    std::map<std::string, BerryNames> database;
    std::map<std::string, std::string> reverse_lookup;
};
const std::string BerryNameDatabase::NULL_SLUG;

// Currently only include berries used in BDSP.
BerryNameDatabase::BerryNameDatabase()
{
    // Load a list of berry slugs in the desired order:
    // ["cheri-berry", "chesto-berry", ... ]
    std::string path_slugs = RESOURCE_PATH().toStdString() + "Pokemon/ItemListBerries.json";
    JsonValue json_slugs = load_json_file(path_slugs);
    JsonArray* slugs = json_slugs.get_array();
    if (slugs == nullptr){
        throw FileException(nullptr, PA_CURRENT_FUNCTION, "Unable to load resource.", std::move(path_slugs));
    }

    // Load a map of berry slugs to berry names in all languages, e.g.:
    // {
    //      "cheri-berry": {
    //          "eng": "Cheri Berry",
    //          "fra": "Baie Ceriz",
    //          ...
    //      },
    //      ....
    // }
    std::string path_disp = RESOURCE_PATH().toStdString() + "Pokemon/ItemNameDisplay.json";
    JsonValue json_disp = load_json_file(path_disp);
    JsonObject* item_disp = json_disp.get_object();
    if (item_disp == nullptr){
        throw FileException(nullptr, PA_CURRENT_FUNCTION, "Unable to load resource.", std::move(path_disp));
    }

    for (auto& item : *slugs){
        std::string* slug = item.get_string();
        if (slug == nullptr || slug->empty()){
            throw FileException(
                nullptr, PA_CURRENT_FUNCTION,
                "Expected non-empty string for Pokemon slug.",
                std::move(path_slugs)
            );
        }

        const auto berry_name_dict_iter = item_disp->find(*slug);
        if (berry_name_dict_iter == item_disp->end()){
            throw FileException(
                nullptr, PA_CURRENT_FUNCTION,
                "Fail to find berry: " + *slug,
                std::move(path_disp)
            );
        }

        JsonObject* berry_name_dict = berry_name_dict_iter->second.get_object();
        if (berry_name_dict == nullptr){
            throw FileException(
                nullptr, PA_CURRENT_FUNCTION,
                "No display names found: " + *slug,
                std::move(path_disp)
            );
        }
        auto berry_eng_name_iter = berry_name_dict->find("eng");
        if (berry_eng_name_iter == berry_name_dict->end()){
            throw FileException(
                nullptr, PA_CURRENT_FUNCTION,
                "Fail to find English display name for: " + *slug,
                std::move(path_disp)
            );
        }

        std::string* display_name = berry_eng_name_iter->second.get_string();
        if (display_name == nullptr || display_name->empty()){
            throw FileException(
                nullptr, PA_CURRENT_FUNCTION,
                "Expected non-empty string for slug: *slug",
                std::move(path_disp)
            );
        }

        ordered_list.push_back(*slug);
        database[*slug].m_display_name = std::move(*display_name);

        // std::cout << "Berry: " << slug_str << " -> " << display_name.toStdString() << std::endl;
    }

    for (const auto& item : database){
        reverse_lookup[item.second.m_display_name] = item.first;
    }
}

const BerryNames& get_berry_name(const std::string& slug){
    const std::map<std::string, BerryNames>& database = BerryNameDatabase::instance().database;
    auto iter = database.find(slug);
    if (iter == database.end()){
        throw InternalProgramError(
            nullptr, PA_CURRENT_FUNCTION,
            "Berry slug not found in database: " + slug
        );
    }
    return iter->second;
}
const std::string& parse_berry_name(const std::string& display_name){
    const std::map<std::string, std::string>& database = BerryNameDatabase::instance().reverse_lookup;
    auto iter = database.find(display_name);
    if (iter == database.end()){
        throw InternalProgramError(
            nullptr, PA_CURRENT_FUNCTION,
            "Berry name not found in database: " + display_name
        );
    }
    return iter->second;
}
const std::string& parse_berry_name_nothrow(const std::string& display_name){
    const std::map<std::string, std::string>& database = BerryNameDatabase::instance().reverse_lookup;
    auto iter = database.find(display_name);
    if (iter == database.end()){
        return BerryNameDatabase::NULL_SLUG;
    }
    return iter->second;
}


const std::vector<std::string>& BERRY_SLUGS(){
    return BerryNameDatabase::instance().ordered_list;
}


}
}
