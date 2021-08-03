/*  Shiny Sparkle Detector
 *
 *  From: https://github.com/PokemonAutomation/Arduino-Source
 *
 */

#include "PokemonSwSh_ShinySparkleDetector.h"

namespace PokemonAutomation{
namespace NintendoSwitch{
namespace PokemonSwSh{



ShinySparkleDetector::ShinySparkleDetector(
    VideoFeed& feed, Logger& logger,
    const InferenceBox& detection_box,
    double detection_threshold
)
    : m_feed(feed)
    , m_logger(logger)
    , m_detection_box(feed, detection_box)
    , m_detection_threshold(detection_threshold)
{}


ShinyType ShinySparkleDetector::results() const{
    double alpha = m_image_alpha.shiny;

    m_logger.log(
        "ShinySparkleDetector: Overall Alpha = " + QString::number(alpha) +
        ", Star Alpha = " + QString::number(m_image_alpha.star) +
        ", Square Alpha = " + QString::number(m_image_alpha.square),
        "purple"
    );

    if (alpha < m_detection_threshold){
        m_logger.log("ShinySparkleDetector: Not Shiny.", "purple");
        return ShinyType::NOT_SHINY;
    }
    if (m_image_alpha.star > 0 && m_image_alpha.star > m_image_alpha.square * 2){
        m_logger.log("ShinySparkleDetector: Detected Star Shiny!", "blue");
        return ShinyType::STAR_SHINY;
    }
    if (m_image_alpha.square > 0 && m_image_alpha.square > m_image_alpha.star * 2){
        m_logger.log("ShinySparkleDetector: Detected Square Shiny!", "blue");
        return ShinyType::SQUARE_SHINY;
    }

    m_logger.log("ShinySparkleDetector: Detected Shiny! But ambiguous shiny type.", "blue");
    return ShinyType::UNKNOWN_SHINY;
}


bool ShinySparkleDetector::on_frame(
    const QImage& frame,
    std::chrono::system_clock::time_point timestamp
){
    QImage shiny_box = extract_box(frame, m_detection_box);

    ShinyImageDetection signatures;
    signatures.accumulate(shiny_box, timestamp.time_since_epoch().count(), &m_logger);

    ShinyImageAlpha frame_alpha = signatures.alpha();

    m_image_alpha.max(frame_alpha);

    if (frame_alpha.shiny > 0){
        if (frame_alpha.shiny >= m_detection_threshold){
            m_logger.log(
                "ShinyDetector: alpha = " + QString::number(frame_alpha.shiny) + " / "  + QString::number(m_image_alpha.shiny) + " (threshold exceeded)",
                "blue"
            );
        }else{
            m_logger.log(
                "ShinyDetector: alpha = " + QString::number(frame_alpha.shiny) + " / "  + QString::number(m_image_alpha.shiny),
                "blue"
            );
        }
    }

    m_detection_overlays.clear();
    for (const auto& item : signatures.balls){
        InferenceBox box = translate_to_parent(frame, m_detection_box, item);
        box.color = Qt::green;
        m_detection_overlays.emplace_back(m_feed, box);
    }
    for (const auto& item : signatures.stars){
        InferenceBox box = translate_to_parent(frame, m_detection_box, item);
        box.color = Qt::green;
        m_detection_overlays.emplace_back(m_feed, box);
    }
    for (const auto& item : signatures.squares){
        InferenceBox box = translate_to_parent(frame, m_detection_box, item);
        box.color = Qt::green;
        m_detection_overlays.emplace_back(m_feed, box);
    }
    for (const auto& item : signatures.lines){
        InferenceBox box = translate_to_parent(frame, m_detection_box, item);
        box.color = Qt::green;
        m_detection_overlays.emplace_back(m_feed, box);
    }

    return false;
}



}
}
}

