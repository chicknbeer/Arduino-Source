/*  Pokemon Name Select Widget
 *
 *  From: https://github.com/PokemonAutomation/Arduino-Source
 *
 */

#include <QCompleter>
#include "Common/Cpp/Exceptions.h"
#include "CommonFramework/Logging/LoggerQt.h"
#include "Pokemon/Resources/Pokemon_PokemonNames.h"
#include "Pokemon_NameSelectWidget.h"

//#include "Common/Cpp/Time.h"
//#include <iostream>
//using std::cout;
//using std::endl;

namespace PokemonAutomation{
namespace Pokemon{

NameSelectWidget::NameSelectWidget(
    QWidget& parent,
    const std::map<std::string, QIcon>& icons,
    const std::vector<std::string>& slugs,
    const std::string& current_slug,
    const std::map<std::string, std::pair<QString, QIcon>>* extra_names,
    const std::vector<std::string>* extra_name_list,
    const std::map<QString, std::string>* extra_display_name_to_slug
)
    : NoWheelComboBox(&parent)
    , m_extra_display_name_to_slug(extra_display_name_to_slug)
{
    this->setEditable(true);
    this->setInsertPolicy(QComboBox::NoInsert);
    this->completer()->setCompletionMode(QCompleter::PopupCompletion);
    this->completer()->setFilterMode(Qt::MatchContains);
    this->setIconSize(QSize(25, 25));

//    WallClock time0 = current_time();

#if 1
    //  A more optimized version.
    QStringList list;
    for (const std::string& slug : slugs){
        list.append(get_pokemon_name(slug).display_name());
    }
    if (extra_names && extra_name_list){
        for(const std::string& slug : *extra_name_list){
            const auto it = extra_names->find(slug);
            if (it == extra_names->end()){
                throw InternalProgramError(nullptr, PA_CURRENT_FUNCTION, "Extra slug not found: " + slug);
            }
            list.append(it->second.first);
        }
    }
    this->addItems(list);

    for (size_t index = 0; index < slugs.size(); index++){
        const std::string& slug = slugs[index];

        auto iter = icons.find(slug);
        if (iter == icons.end()){
            global_logger_tagged().log("Missing sprite for: " + slug, COLOR_RED);
        }else{
            this->setItemIcon((int)index, iter->second);
        }

        if (slug == current_slug){
            this->setCurrentIndex((int)index);
        }
    }
    if (extra_names && extra_name_list){
        for (size_t index = 0; index < extra_name_list->size(); index++){
            const std::string& slug = extra_name_list->at(index);
            const auto it = extra_names->find(slug);
            if (it == extra_names->end()){
                global_logger_tagged().log("Missing sprite for extra slug: " + slug, COLOR_RED);
            }else{
                this->setItemIcon((int)index+slugs.size(), it->second.second);
            }

            if (slug == current_slug){
                this->setCurrentIndex((int)index+slugs.size());
            }
        }
    }
#else
    for (size_t index = 0; index < slugs.size(); index++){
        const std::string& slug = slugs[index];

        auto iter = icons.find(slug);
        if (iter == icons.end()){
            this->addItem(
                get_pokemon_name(slug).display_name()
            );
            global_logger_tagged().log("Missing sprite for: " + slug, COLOR_RED);
        }else{
            this->addItem(
                iter->second,
                get_pokemon_name(slug).display_name()
            );
        }

        if (slug == current_slug){
            this->setCurrentIndex((int)index);
        }
    }
#endif

//    WallClock time3 = current_time();
//    cout << std::chrono::duration_cast<std::chrono::milliseconds>(time3 - time0).count() / 1000. << endl;

    update_size_cache();
}
std::string NameSelectWidget::slug() const{
    QString current_text = currentText();
    if (m_extra_display_name_to_slug){
        auto it = m_extra_display_name_to_slug->find(current_text);
        if (it != m_extra_display_name_to_slug->end()){
            return it->second;
        }
    }
    return parse_pokemon_name_nothrow(current_text);
}





}
}
