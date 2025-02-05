/*  Discord Webhook
 *
 *  From: https://github.com/PokemonAutomation/Arduino-Source
 *
 */

#ifndef PokemonAutomation_DiscordWebhook_H
#define PokemonAutomation_DiscordWebhook_H

#include <deque>
#include <condition_variable>
#include <QNetworkReply>
#include "Common/Cpp/Time.h"
#include "Common/Cpp/Concurrency/ScheduledTaskRunner.h"
#include "CommonFramework/Logging/Logger.h"
#include "CommonFramework/Options/ScreenshotFormatOption.h"
#include "CommonFramework/Notifications/MessageAttachment.h"

class QEventLoop;

namespace PokemonAutomation{
    class JsonArray;
    class JsonObject;
namespace Integration{
namespace DiscordWebhook{



class DiscordWebhookSender : public QObject{
    Q_OBJECT

    static constexpr auto THROTTLE_DURATION = std::chrono::seconds(1);
//    static constexpr size_t MAX_IN_WINDOW = 2;

private:
    DiscordWebhookSender();
    ~DiscordWebhookSender();


public:
    void send_json(
        Logger& logger,
        const QUrl& url, std::chrono::milliseconds delay,
        const JsonObject& obj,
        std::shared_ptr<PendingFileSend> file
    );
    void send_file(
        Logger& logger,
        const QUrl& url, std::chrono::milliseconds delay,
        std::shared_ptr<PendingFileSend> file
    );

    static DiscordWebhookSender& instance();


private:
    void cleanup_stuck_requests();
//    void thread_loop();
    void throttle();

    void process_reply(QNetworkReply* reply);
    void internal_send_json(const QUrl& url, const QByteArray& data);
    void internal_send_file(const QUrl& url, const std::string& filename);
    void internal_send_image_embed(const QUrl& url, const QByteArray& data, const std::string& filepath, const std::string& filename);

signals:
    void stop_event_loop();

private:
    TaggedLogger m_logger;
    bool m_stopping;
    std::mutex m_lock;
    std::condition_variable m_cv;

    std::deque<WallClock> m_sent;
    AsyncDispatcher m_dispatcher;
    ScheduledTaskRunner m_queue;
};




void send_message(
    Logger& logger,
    bool should_ping,
    const std::vector<std::string>& tags,
    const std::string& message,
    const JsonArray& embeds,
    std::shared_ptr<PendingFileSend> file
);



}
}
}
#endif
