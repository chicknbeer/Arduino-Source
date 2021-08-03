
QT += core gui
QT += serialport
QT += multimedia
QT += multimediawidgets

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

INCLUDEPATH += ../
INCLUDEPATH += Source/

CONFIG += force_debug_info

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


win32-g++{
    CONFIG += c++14

    QMAKE_CXXFLAGS += -msse4.2
#    QMAKE_CXXFLAGS += -Wnarrowing
#    QMAKE_CXXFLAGS += -Wno-unused-parameter
#    QMAKE_CXXFLAGS += -Wno-unused-function
#    QMAKE_CXXFLAGS += -Wno-missing-field-initializers

    DEFINES += WIN32
    DEFINES += TESS_IMPORTS
    DEFINES += PA_TESSERACT
    LIBS += ../SerialPrograms/tesseractPA.lib
}
win32-msvc{
    QMAKE_CXXFLAGS += /std:c++latest

    DEFINES += WIN32
    DEFINES += TESS_IMPORTS
    DEFINES += PA_TESSERACT
    LIBS += ../SerialPrograms/tesseractPA.lib
}
macx{
    QMAKE_CXXFLAGS += -std=c++14

    QMAKE_INFO_PLIST = macos/Info.plist
}


SOURCES += \
    ../ClientSource/Connection/PABotBase.cpp \
    ../ClientSource/Connection/PABotBaseConnection.cpp \
    ../ClientSource/Libraries/Logging.cpp \
    ../ClientSource/Libraries/MessageConverter.cpp \
    ../Common/CRC32.cpp \
    ../Common/Cpp/AsyncDispatcher.cpp \
    ../Common/Cpp/Exception.cpp \
    ../Common/Cpp/PanicDump.cpp \
    ../Common/Cpp/ParallelTaskRunner.cpp \
    ../Common/Cpp/PrettyPrint.cpp \
    ../Common/Cpp/Unicode.cpp \
    ../Common/PokemonSwSh/PokemonSettings.cpp \
    ../Common/PokemonSwSh/PokemonSwShAutoHosts.cpp \
    ../Common/PokemonSwSh/PokemonSwShDateSpam.cpp \
    ../Common/PokemonSwSh/PokemonSwShDaySkippers.cpp \
    ../Common/PokemonSwSh/PokemonSwShEggRoutines.cpp \
    ../Common/PokemonSwSh/PokemonSwShGameEntry.cpp \
    ../Common/PokemonSwSh/PokemonSwShMisc.cpp \
    ../Common/Qt/CodeValidator.cpp \
    ../Common/Qt/ExpressionEvaluator.cpp \
    ../Common/Qt/Options/BooleanCheckBoxOption.cpp \
    ../Common/Qt/Options/FloatingPointOption.cpp \
    ../Common/Qt/Options/FossilTableOption.cpp \
    ../Common/Qt/Options/MultiHostTableOption.cpp \
    ../Common/Qt/Options/SimpleIntegerOption.cpp \
	../Common/Qt/Options/StringOption.cpp \
    ../Common/Qt/Options/SwitchDateOption.cpp \
    ../Common/Qt/Options/TimeExpressionOption.cpp \
    ../Common/Qt/QtJsonTools.cpp \
    ../Common/SwitchFramework/FrameworkSettings.cpp \
    ../Common/SwitchFramework/Switch_PushButtons.cpp \
    ../Common/SwitchRoutines/SwitchDigitEntry.cpp \
    Source/CommonFramework/CrashDump.cpp \
    Source/CommonFramework/GlobalSettingsPanel.cpp \
    Source/CommonFramework/Globals.cpp \
    Source/CommonFramework/Inference/AnomalyDetector.cpp \
    Source/CommonFramework/Inference/BlackScreenDetector.cpp \
    Source/CommonFramework/Inference/ColorClustering.cpp \
    Source/CommonFramework/Inference/FillGeometry.cpp \
    Source/CommonFramework/Inference/FillMatrix.cpp \
    Source/CommonFramework/Inference/ImageTools.cpp \
    Source/CommonFramework/Inference/VisualInferenceCallback.cpp \
    Source/CommonFramework/Inference/VisualInferenceSession.cpp \
    Source/CommonFramework/Inference/VisualInferenceWait.cpp \
    Source/CommonFramework/Language.cpp \
    Source/CommonFramework/Main.cpp \
    Source/CommonFramework/OCR/DictionaryMatcher.cpp \
    Source/CommonFramework/OCR/DictionaryOCR.cpp \
    Source/CommonFramework/OCR/Filtering.cpp \
    Source/CommonFramework/OCR/LargeDictionaryMatcher.cpp \
    Source/CommonFramework/OCR/RawOCR.cpp \
    Source/CommonFramework/OCR/SmallDictionaryMatcher.cpp \
    Source/CommonFramework/OCR/StringNormalization.cpp \
    Source/CommonFramework/OCR/TextMatcher.cpp \
    Source/CommonFramework/OCR/TrainingTools.cpp \
    Source/CommonFramework/Options/EnumDropdown.cpp \
    Source/CommonFramework/Options/FixedCode.cpp \
    Source/CommonFramework/Options/LanguageOCR.cpp \
    Source/CommonFramework/Options/RandomCode.cpp \
    Source/CommonFramework/Options/SectionDivider.cpp \
    Source/CommonFramework/Options/StringSelect.cpp \
    Source/CommonFramework/Panels/Panel.cpp \
    Source/CommonFramework/Panels/PanelList.cpp \
    Source/CommonFramework/Panels/RunnableComputerProgram.cpp \
    Source/CommonFramework/Panels/RunnablePanel.cpp \
    Source/CommonFramework/Panels/SettingsPanel.cpp \
    Source/CommonFramework/PersistentSettings.cpp \
    Source/CommonFramework/Tools/BotBaseHandle.cpp \
    Source/CommonFramework/Tools/DiscordWebHook.cpp \
    Source/CommonFramework/Tools/FileWindowLogger.cpp \
    Source/CommonFramework/Tools/InterruptableCommands.cpp \
    Source/CommonFramework/Tools/ProgramEnvironment.cpp \
    Source/CommonFramework/Tools/QueuedLogger.cpp \
    Source/CommonFramework/Tools/StatsDatabase.cpp \
    Source/CommonFramework/Tools/StatsTracking.cpp \
    Source/CommonFramework/Widgets/CameraSelector.cpp \
    Source/CommonFramework/Widgets/SerialSelector.cpp \
    Source/CommonFramework/Widgets/VideoOverlay.cpp \
    Source/CommonFramework/Windows/ButtonDiagram.cpp \
    Source/CommonFramework/Windows/MainWindow.cpp \
    Source/CommonFramework/Windows/OutputWindow.cpp \
    Source/NintendoSwitch/Framework/MultiSwitchProgram.cpp \
    Source/NintendoSwitch/Framework/MultiSwitchSystem.cpp \
    Source/NintendoSwitch/Framework/RunnableSwitchProgram.cpp \
    Source/NintendoSwitch/Framework/SingleSwitchProgram.cpp \
    Source/NintendoSwitch/Framework/SwitchCommandRow.cpp \
    Source/NintendoSwitch/Framework/SwitchProgramTracker.cpp \
    Source/NintendoSwitch/Framework/SwitchSystem.cpp \
    Source/NintendoSwitch/Framework/VirtualSwitchController.cpp \
    Source/NintendoSwitch/Framework/VirtualSwitchControllerMapping.cpp \
    Source/NintendoSwitch/FrameworkSettingsPanel.cpp \
    Source/NintendoSwitch/InferenceTraining/PokemonHome_GenerateNameOCR.cpp \
    Source/NintendoSwitch/Options/FriendCodeList.cpp \
    Source/NintendoSwitch/Panels_NintendoSwitch.cpp \
    Source/NintendoSwitch/Programs/FriendCodeAdder.cpp \
    Source/NintendoSwitch/Programs/FriendDelete.cpp \
    Source/NintendoSwitch/Programs/PokemonHome_PageSwap.cpp \
    Source/NintendoSwitch/Programs/PreventSleep.cpp \
    Source/NintendoSwitch/Programs/SwitchViewer.cpp \
    Source/NintendoSwitch/Programs/TurboButton.cpp \
    Source/NintendoSwitch/Programs/VirtualConsole.cpp \
    Source/NintendoSwitch/TestProgram.cpp \
    Source/PanelLists.cpp \
    Source/Pokemon/Options/Pokemon_NameSelect.cpp \
    Source/Pokemon/Options/Pokemon_NameSelectWidget.cpp \
    Source/Pokemon/Pokemon_EncounterStats.cpp \
    Source/Pokemon/Pokemon_NameReader.cpp \
    Source/Pokemon/Pokemon_Notification.cpp \
    Source/Pokemon/Pokemon_SpeciesDatabase.cpp \
    Source/Pokemon/Pokemon_TrainIVCheckerOCR.cpp \
    Source/Pokemon/Pokemon_TrainPokemonOCR.cpp \
    Source/PokemonBDSP/Panels_PokemonBDSP.cpp \
    Source/PokemonSwSh/Inference/PokemonSwSh_BattleDialogDetector.cpp \
    Source/PokemonSwSh/Inference/PokemonSwSh_BattleMenuDetector.cpp \
    Source/PokemonSwSh/Inference/PokemonSwSh_BeamSetter.cpp \
    Source/PokemonSwSh/Inference/PokemonSwSh_FishingDetector.cpp \
    Source/PokemonSwSh/Inference/PokemonSwSh_IVCheckerReader.cpp \
    Source/PokemonSwSh/Inference/PokemonSwSh_MarkFinder.cpp \
    Source/PokemonSwSh/Inference/PokemonSwSh_RaidCatchDetector.cpp \
    Source/PokemonSwSh/Inference/PokemonSwSh_RaidLobbyReader.cpp \
    Source/PokemonSwSh/Inference/PokemonSwSh_ReceivePokemonDetector.cpp \
    Source/PokemonSwSh/Inference/PokemonSwSh_StartBattleDetector.cpp \
    Source/PokemonSwSh/Inference/PokemonSwSh_SummaryShinySymbolDetector.cpp \
    Source/PokemonSwSh/Inference/ShinyDetection/PokemonSwSh_ShinyDialogTracker.cpp \
    Source/PokemonSwSh/Inference/ShinyDetection/PokemonSwSh_ShinyEncounterDetector.cpp \
    Source/PokemonSwSh/Inference/ShinyDetection/PokemonSwSh_ShinySparkleDetector.cpp \
    Source/PokemonSwSh/Inference/ShinyDetection/PokemonSwSh_ShinyTrigger.cpp \
    Source/PokemonSwSh/Inference/ShinyDetection/PokemonSwSh_SparkleTrigger.cpp \
    Source/PokemonSwSh/Inference/ShinyDetection/PokemonSwSh_SquareDetector.cpp \
    Source/PokemonSwSh/Inference/ShinyDetection/PokemonSwSh_SquareTrigger.cpp \
    Source/PokemonSwSh/InferenceTraining/PokemonSwSh_GenerateIVCheckerOCR.cpp \
    Source/PokemonSwSh/InferenceTraining/PokemonSwSh_GenerateNameOCRPokedex.cpp \
    Source/PokemonSwSh/Options/Catchability.cpp \
    Source/PokemonSwSh/Options/EggStepCount.cpp \
    Source/PokemonSwSh/Options/EncounterFilter.cpp \
    Source/PokemonSwSh/Options/RegiSelector.cpp \
    Source/PokemonSwSh/Panels_PokemonSwSh.cpp \
    Source/PokemonSwSh/PokemonSwSh_SettingsPanel.cpp \
    Source/PokemonSwSh/Programs/General/PokemonSwSh_BallThrower.cpp \
    Source/PokemonSwSh/Programs/General/PokemonSwSh_ClothingBuyer.cpp \
    Source/PokemonSwSh/Programs/General/PokemonSwSh_DexRecFinder.cpp \
    Source/PokemonSwSh/Programs/General/PokemonSwSh_MassRelease.cpp \
    Source/PokemonSwSh/Programs/General/PokemonSwSh_StatsReset.cpp \
    Source/PokemonSwSh/Programs/General/PokemonSwSh_SurpriseTrade.cpp \
    Source/PokemonSwSh/Programs/General/PokemonSwSh_TradeBot.cpp \
    Source/PokemonSwSh/Programs/General/PokemonSwSh_TurboA.cpp \
    Source/PokemonSwSh/Programs/Hosting/PokemonSwSh_AutoHostStats.cpp \
    Source/PokemonSwSh/Programs/OverworldBot/PokemonSwSh_OverworldMovement.cpp \
    Source/PokemonSwSh/Programs/OverworldBot/PokemonSwSh_OverworldTargetTracker.cpp \
    Source/PokemonSwSh/Programs/OverworldBot/PokemonSwSh_OverworldTrajectory.cpp \
    Source/PokemonSwSh/Programs/OverworldBot/PokemonSwSh_OverworldTrigger.cpp \
    Source/PokemonSwSh/Programs/OverworldBot/PokemonSwSh_ShinyHuntAutonomous-Overworld.cpp \
    Source/PokemonSwSh/Programs/PokemonSwSh_EncounterDetection.cpp \
    Source/PokemonSwSh/Programs/PokemonSwSh_EncounterHandler.cpp \
    Source/PokemonSwSh/Programs/PokemonSwSh_StartGame.cpp \
    Source/PokemonSwSh/Programs/ShinyHuntAutonomous/PokemonSwSh_ShinyHuntAutonomous-BerryTree.cpp \
    Source/PokemonSwSh/Programs/ShinyHuntAutonomous/PokemonSwSh_ShinyHuntAutonomous-Fishing.cpp \
    Source/PokemonSwSh/Programs/ShinyHuntAutonomous/PokemonSwSh_ShinyHuntAutonomous-IoATrade.cpp \
    Source/PokemonSwSh/Programs/ShinyHuntAutonomous/PokemonSwSh_ShinyHuntAutonomous-Regi.cpp \
    Source/PokemonSwSh/Programs/ShinyHuntAutonomous/PokemonSwSh_ShinyHuntAutonomous-Regigigas2.cpp \
    Source/PokemonSwSh/Programs/ShinyHuntAutonomous/PokemonSwSh_ShinyHuntAutonomous-StrongSpawn.cpp \
    Source/PokemonSwSh/Programs/ShinyHuntAutonomous/PokemonSwSh_ShinyHuntAutonomous-SwordsOfJustice.cpp \
    Source/PokemonSwSh/Programs/ShinyHuntAutonomous/PokemonSwSh_ShinyHuntAutonomous-Whistling.cpp \
    Source/PokemonSwSh/Programs/ShinyHuntUnattended/PokemonSwSh_CurryHunter.cpp \
    Source/PokemonSwSh/Programs/ShinyHuntUnattended/PokemonSwSh_MultiGameFossil.cpp \
    Source/PokemonSwSh/Programs/ShinyHuntUnattended/PokemonSwSh_ShinyHunt-Regi.cpp \
    Source/PokemonSwSh/Programs/ShinyHuntUnattended/PokemonSwSh_ShinyHuntTools.cpp \
    Source/PokemonSwSh/Programs/ShinyHuntUnattended/PokemonSwSh_ShinyHuntUnattended-IoATrade.cpp \
    Source/PokemonSwSh/Programs/ShinyHuntUnattended/PokemonSwSh_ShinyHuntUnattended-Regi.cpp \
    Source/PokemonSwSh/Programs/ShinyHuntUnattended/PokemonSwSh_ShinyHuntUnattended-Regigigas2.cpp \
    Source/PokemonSwSh/Programs/ShinyHuntUnattended/PokemonSwSh_ShinyHuntUnattended-StrongSpawn.cpp \
    Source/PokemonSwSh/Programs/ShinyHuntUnattended/PokemonSwSh_ShinyHuntUnattended-SwordsOfJustice.cpp \
    Source/PokemonSwSh/Programs/DateSpamFarmers/PokemonSwSh_DateSpam-BerryFarmer.cpp \
    Source/PokemonSwSh/Programs/DateSpamFarmers/PokemonSwSh_DateSpam-DailyHighlightFarmer.cpp \
    Source/PokemonSwSh/Programs/DateSpamFarmers/PokemonSwSh_DateSpam-LotoFarmer.cpp \
    Source/PokemonSwSh/Programs/DateSpamFarmers/PokemonSwSh_DateSpam-StowOnSideFarmer.cpp \
    Source/PokemonSwSh/Programs/DateSpamFarmers/PokemonSwSh_DateSpam-WattFarmer.cpp \
    Source/PokemonSwSh/Programs/DenHunting/PokemonSwSh_BeamReset.cpp \
    Source/PokemonSwSh/Programs/DenHunting/PokemonSwSh_DaySkipperEU.cpp \
    Source/PokemonSwSh/Programs/DenHunting/PokemonSwSh_DaySkipperJPN-7.8k.cpp \
    Source/PokemonSwSh/Programs/DenHunting/PokemonSwSh_DaySkipperJPN.cpp \
    Source/PokemonSwSh/Programs/DenHunting/PokemonSwSh_DaySkipperUS.cpp \
    Source/PokemonSwSh/Programs/DenHunting/PokemonSwSh_EventBeamFinder.cpp \
    Source/PokemonSwSh/Programs/DenHunting/PokemonSwSh_PurpleBeamFinder.cpp \
    Source/PokemonSwSh/Programs/EggPrograms/PokemonSwSh_EggCombined2.cpp \
    Source/PokemonSwSh/Programs/EggPrograms/PokemonSwSh_EggFetcher2.cpp \
    Source/PokemonSwSh/Programs/EggPrograms/PokemonSwSh_EggHatcher.cpp \
    Source/PokemonSwSh/Programs/EggPrograms/PokemonSwSh_EggSuperCombined2.cpp \
    Source/PokemonSwSh/Programs/EggPrograms/PokemonSwSh_GodEggDuplication.cpp \
    Source/PokemonSwSh/Programs/EggPrograms/PokemonSwSh_GodEggItemDupe.cpp \
    Source/PokemonSwSh/Programs/Hosting/PokemonSwSh_AutoHost-MultiGame.cpp \
    Source/PokemonSwSh/Programs/Hosting/PokemonSwSh_AutoHost-Rolling.cpp \
    Source/PokemonSwSh/Programs/Hosting/PokemonSwSh_DenRoller.cpp \
    Source/PokemonSwSh/Programs/PokemonSwSh_RaidItemFarmerOKHO.cpp \
    Source/PokemonSwSh/Programs/PokemonSwSh_SynchronizedSpinning.cpp \
    Source/PokemonSwSh/Programs/QoLMacros/PokemonSwSh_FastCodeEntry.cpp \
    Source/PokemonSwSh/Programs/QoLMacros/PokemonSwSh_FriendSearchDisconnect.cpp \
    Source/PokemonSwSh/ShinyHuntTracker.cpp

HEADERS += \
    ../ClientSource/Connection/BotBase.h \
    ../ClientSource/Connection/PABotBase.h \
    ../ClientSource/Connection/PABotBaseConnection.h \
    ../ClientSource/Connection/SerialConnection.h \
    ../ClientSource/Connection/SerialConnectionPOSIX.h \
    ../ClientSource/Connection/SerialConnectionWinAPI.h \
    ../ClientSource/Connection/StreamInterface.h \
    ../ClientSource/Libraries/Logging.h \
    ../ClientSource/Libraries/MessageConverter.h \
    ../Common/CRC32.h \
    ../Common/Compiler.h \
    ../Common/Cpp/AsyncDispatcher.h \
    ../Common/Cpp/Exception.h \
    ../Common/Cpp/FixedLimitVector.h \
    ../Common/Cpp/PanicDump.h \
    ../Common/Cpp/ParallelTaskRunner.h \
    ../Common/Cpp/PrettyPrint.h \
    ../Common/Cpp/SpinLock.h \
    ../Common/Cpp/Unicode.h \
    ../Common/MessageProtocol.h \
    ../Common/PokemonSwSh/PokemonProgramIDs.h \
    ../Common/PokemonSwSh/PokemonSettings.h \
    ../Common/PokemonSwSh/PokemonSwShAutoHosts.h \
    ../Common/PokemonSwSh/PokemonSwShDateSpam.h \
    ../Common/PokemonSwSh/PokemonSwShDaySkippers.h \
    ../Common/PokemonSwSh/PokemonSwShEggRoutines.h \
    ../Common/PokemonSwSh/PokemonSwShGameEntry.h \
    ../Common/PokemonSwSh/PokemonSwShMisc.h \
    ../Common/Qt/CodeValidator.h \
    ../Common/Qt/ExpressionEvaluator.h \
    ../Common/Qt/NoWheelComboBox.h \
    ../Common/Qt/Options/BooleanCheckBoxOption.h \
    ../Common/Qt/Options/FloatingPointOption.h \
    ../Common/Qt/Options/FossilTableOption.h \
    ../Common/Qt/Options/MultiHostTableOption.h \
    ../Common/Qt/Options/SimpleIntegerOption.h \
	../Common/Qt/Options/StringOption.h \
    ../Common/Qt/Options/SwitchDateOption.h \
    ../Common/Qt/Options/TimeExpressionOption.h \
    ../Common/Qt/QtJsonTools.h \
    ../Common/SwitchFramework/FrameworkSettings.h \
    ../Common/SwitchFramework/Switch_PushButtons.h \
    ../Common/SwitchFramework/SwitchControllerDefs.h \
    ../Common/SwitchFramework/Switch_PushButtons.h \
    ../Common/SwitchRoutines/SwitchDigitEntry.h \
    Source/CommonFramework/CrashDump.h \
    Source/CommonFramework/GlobalSettingsPanel.h \
    Source/CommonFramework/Globals.h \
    Source/CommonFramework/Inference/AnomalyDetector.h \
    Source/CommonFramework/Inference/BlackScreenDetector.h \
    Source/CommonFramework/Inference/ColorClustering.h \
    Source/CommonFramework/Inference/FillGeometry.h \
    Source/CommonFramework/Inference/FillMatrix.h \
    Source/CommonFramework/Inference/FloatPixel.h \
    Source/CommonFramework/Inference/ImageTools.h \
    Source/CommonFramework/Inference/InferenceThrottler.h \
    Source/CommonFramework/Inference/InferenceTypes.h \
    Source/CommonFramework/Inference/StatAccumulator.h \
    Source/CommonFramework/Inference/TimeWindowStatTracker.h \
    Source/CommonFramework/Inference/VisualInferenceCallback.h \
    Source/CommonFramework/Inference/VisualInferenceSession.h \
    Source/CommonFramework/Inference/VisualInferenceWait.h \
    Source/CommonFramework/Language.h \
    Source/CommonFramework/OCR/DictionaryMatcher.h \
    Source/CommonFramework/OCR/DictionaryOCR.h \
    Source/CommonFramework/OCR/Filtering.h \
    Source/CommonFramework/OCR/LargeDictionaryMatcher.h \
    Source/CommonFramework/OCR/RawOCR.h \
    Source/CommonFramework/OCR/SmallDictionaryMatcher.h \
    Source/CommonFramework/OCR/StringNormalization.h \
    Source/CommonFramework/OCR/TesseractPA.h \
    Source/CommonFramework/OCR/TextMatcher.h \
    Source/CommonFramework/OCR/TrainingTools.h \
    Source/CommonFramework/Options/BooleanCheckBox.h \
    Source/CommonFramework/Options/ConfigOption.h \
    Source/CommonFramework/Options/EnumDropdown.h \
    Source/CommonFramework/Options/FixedCode.h \
    Source/CommonFramework/Options/FloatingPoint.h \
    Source/CommonFramework/Options/LanguageOCR.h \
    Source/CommonFramework/Options/RandomCode.h \
    Source/CommonFramework/Options/SectionDivider.h \
    Source/CommonFramework/Options/SimpleInteger.h \
    Source/CommonFramework/Options/StringSelect.h \
    Source/CommonFramework/Panels/Panel.h \
    Source/CommonFramework/Panels/PanelList.h \
    Source/CommonFramework/Panels/RunnableComputerProgram.h \
    Source/CommonFramework/Panels/RunnablePanel.h \
    Source/CommonFramework/Panels/SettingsPanel.h \
    Source/CommonFramework/PersistentSettings.h \
    Source/CommonFramework/Tools/ConsoleHandle.h \
    Source/CommonFramework/Tools/DiscordWebHook.h \
    Source/CommonFramework/Tools/FileWindowLogger.h \
    Source/CommonFramework/Tools/InterruptableCommands.h \
    Source/CommonFramework/Tools/Logger.h \
    Source/CommonFramework/Tools/ProgramEnvironment.h \
    Source/CommonFramework/Tools/QueuedLogger.h \
    Source/CommonFramework/Tools/StatsDatabase.h \
    Source/CommonFramework/Tools/StatsTracking.h \
    Source/CommonFramework/Tools/VideoFeed.h \
    Source/CommonFramework/Tools/BotBaseHandle.h \
    Source/CommonFramework/Widgets/CameraSelector.h \
    Source/CommonFramework/Widgets/SerialSelector.h \
    Source/CommonFramework/Widgets/VideoOverlay.h \
    Source/CommonFramework/Windows/ButtonDiagram.h \
    Source/CommonFramework/Windows/MainWindow.h \
    Source/CommonFramework/Windows/OutputWindow.h \
    Source/NintendoSwitch/FixedInterval.h \
    Source/NintendoSwitch/Framework/MultiSwitchProgram.h \
    Source/NintendoSwitch/Framework/MultiSwitchSystem.h \
    Source/NintendoSwitch/Framework/RunnableSwitchProgram.h \
    Source/NintendoSwitch/Framework/SingleSwitchProgram.h \
    Source/NintendoSwitch/Framework/SwitchCommandRow.h \
    Source/NintendoSwitch/Framework/SwitchProgramTracker.h \
    Source/NintendoSwitch/Framework/SwitchSetup.h \
    Source/NintendoSwitch/Framework/SwitchSystem.h \
    Source/NintendoSwitch/Framework/VirtualSwitchController.h \
    Source/NintendoSwitch/Framework/VirtualSwitchControllerMapping.h \
    Source/NintendoSwitch/FrameworkSettingsPanel.h \
    Source/NintendoSwitch/InferenceTraining/PokemonHome_GenerateNameOCR.h \
    Source/NintendoSwitch/Options/FriendCodeList.h \
    Source/NintendoSwitch/Options/GoHomeWhenDone.h \
    Source/NintendoSwitch/Options/StartInGripMenu.h \
    Source/NintendoSwitch/Options/SwitchDate.h \
    Source/NintendoSwitch/Options/TimeExpression.h \
    Source/NintendoSwitch/Panels_NintendoSwitch.h \
    Source/NintendoSwitch/Programs/FriendCodeAdder.h \
    Source/NintendoSwitch/Programs/FriendDelete.h \
    Source/NintendoSwitch/Programs/PokemonHome_PageSwap.h \
    Source/NintendoSwitch/Programs/PreventSleep.h \
    Source/NintendoSwitch/Programs/SwitchViewer.h \
    Source/NintendoSwitch/Programs/TurboButton.h \
    Source/NintendoSwitch/Programs/VirtualConsole.h \
    Source/NintendoSwitch/TestProgram.h \
    Source/PanelLists.h \
    Source/Pokemon/Options/Pokemon_EncounterBotOptions.h \
    Source/Pokemon/Options/Pokemon_NameSelect.h \
    Source/Pokemon/Options/Pokemon_NameSelectWidget.h \
    Source/Pokemon/Pokemon_EncounterStats.h \
    Source/Pokemon/Pokemon_NameReader.h \
    Source/Pokemon/Pokemon_Notification.h \
    Source/Pokemon/Pokemon_SpeciesDatabase.h \
    Source/Pokemon/Pokemon_TrainIVCheckerOCR.h \
    Source/Pokemon/Pokemon_TrainPokemonOCR.h \
    Source/Pokemon/Pokemon_Types.h \
    Source/PokemonBDSP/Panels_PokemonBDSP.h \
    Source/PokemonSwSh/Inference/PokemonSwSh_BattleDialogDetector.h \
    Source/PokemonSwSh/Inference/PokemonSwSh_BattleMenuDetector.h \
    Source/PokemonSwSh/Inference/PokemonSwSh_BeamSetter.h \
    Source/PokemonSwSh/Inference/PokemonSwSh_FishingDetector.h \
    Source/PokemonSwSh/Inference/PokemonSwSh_IVCheckerReader.h \
    Source/PokemonSwSh/Inference/PokemonSwSh_MarkFinder.h \
    Source/PokemonSwSh/Inference/PokemonSwSh_RaidCatchDetector.h \
    Source/PokemonSwSh/Inference/PokemonSwSh_RaidLobbyReader.h \
    Source/PokemonSwSh/Inference/PokemonSwSh_ReceivePokemonDetector.h \
    Source/PokemonSwSh/Inference/PokemonSwSh_StartBattleDetector.h \
    Source/PokemonSwSh/Inference/PokemonSwSh_SummaryShinySymbolDetector.h \
    Source/PokemonSwSh/Inference/ShinyDetection/PokemonSwSh_ShinyDialogTracker.h \
    Source/PokemonSwSh/Inference/ShinyDetection/PokemonSwSh_ShinyEncounterDetector.h \
    Source/PokemonSwSh/Inference/ShinyDetection/PokemonSwSh_ShinyFilters.h \
    Source/PokemonSwSh/Inference/ShinyDetection/PokemonSwSh_ShinySparkleDetector.h \
    Source/PokemonSwSh/Inference/ShinyDetection/PokemonSwSh_ShinyTrigger.h \
    Source/PokemonSwSh/Inference/ShinyDetection/PokemonSwSh_SparkleTrigger.h \
    Source/PokemonSwSh/Inference/ShinyDetection/PokemonSwSh_SquareDetector.h \
    Source/PokemonSwSh/Inference/ShinyDetection/PokemonSwSh_SquareTrigger.h \
    Source/PokemonSwSh/InferenceTraining/PokemonSwSh_GenerateIVCheckerOCR.h \
    Source/PokemonSwSh/InferenceTraining/PokemonSwSh_GenerateNameOCRPokedex.h \
    Source/PokemonSwSh/Options/Catchability.h \
    Source/PokemonSwSh/Options/EggStepCount.h \
    Source/PokemonSwSh/Options/EncounterFilter.h \
    Source/PokemonSwSh/Options/FossilTable.h \
    Source/PokemonSwSh/Options/MultiHostTable.h \
    Source/PokemonSwSh/Options/RegiSelector.h \
    Source/PokemonSwSh/Panels_PokemonSwSh.h \
    Source/PokemonSwSh/PokemonSwSh_SettingsPanel.h \
    Source/PokemonSwSh/Programs/DenHunting/PokemonSwSh_DaySkipperStats.h \
    Source/PokemonSwSh/Programs/General/PokemonSwSh_BallThrower.h \
    Source/PokemonSwSh/Programs/General/PokemonSwSh_ClothingBuyer.h \
    Source/PokemonSwSh/Programs/General/PokemonSwSh_DexRecFinder.h \
    Source/PokemonSwSh/Programs/General/PokemonSwSh_MassRelease.h \
    Source/PokemonSwSh/Programs/General/PokemonSwSh_StatsReset.h \
    Source/PokemonSwSh/Programs/General/PokemonSwSh_SurpriseTrade.h \
    Source/PokemonSwSh/Programs/General/PokemonSwSh_TradeBot.h \
    Source/PokemonSwSh/Programs/General/PokemonSwSh_TurboA.h \
    Source/PokemonSwSh/Programs/Hosting/PokemonSwSh_AutoHostStats.h \
    Source/PokemonSwSh/Programs/OverworldBot/PokemonSwSh_OverworldMovement.h \
    Source/PokemonSwSh/Programs/OverworldBot/PokemonSwSh_OverworldTargetTracker.h \
    Source/PokemonSwSh/Programs/OverworldBot/PokemonSwSh_OverworldTrajectory.h \
    Source/PokemonSwSh/Programs/OverworldBot/PokemonSwSh_OverworldTrigger.h \
    Source/PokemonSwSh/Programs/OverworldBot/PokemonSwSh_ShinyHuntAutonomous-Overworld.h \
    Source/PokemonSwSh/Programs/PokemonSwSh_EncounterDetection.h \
    Source/PokemonSwSh/Programs/PokemonSwSh_EncounterHandler.h \
    Source/PokemonSwSh/Programs/PokemonSwSh_StartGame.h \
    Source/PokemonSwSh/Programs/ShinyHuntAutonomous/PokemonSwSh_ShinyHuntAutonomous-BerryTree.h \
    Source/PokemonSwSh/Programs/ShinyHuntAutonomous/PokemonSwSh_ShinyHuntAutonomous-Fishing.h \
    Source/PokemonSwSh/Programs/ShinyHuntAutonomous/PokemonSwSh_ShinyHuntAutonomous-IoATrade.h \
    Source/PokemonSwSh/Programs/ShinyHuntAutonomous/PokemonSwSh_ShinyHuntAutonomous-Regi.h \
    Source/PokemonSwSh/Programs/ShinyHuntAutonomous/PokemonSwSh_ShinyHuntAutonomous-Regigigas2.h \
    Source/PokemonSwSh/Programs/ShinyHuntAutonomous/PokemonSwSh_ShinyHuntAutonomous-StrongSpawn.h \
    Source/PokemonSwSh/Programs/ShinyHuntAutonomous/PokemonSwSh_ShinyHuntAutonomous-SwordsOfJustice.h \
    Source/PokemonSwSh/Programs/ShinyHuntAutonomous/PokemonSwSh_ShinyHuntAutonomous-Whistling.h \
    Source/PokemonSwSh/Programs/ShinyHuntUnattended/PokemonSwSh_CurryHunter.h \
    Source/PokemonSwSh/Programs/ShinyHuntUnattended/PokemonSwSh_MultiGameFossil.h \
    Source/PokemonSwSh/Programs/ShinyHuntUnattended/PokemonSwSh_ShinyHunt-Regi.h \
    Source/PokemonSwSh/Programs/ShinyHuntUnattended/PokemonSwSh_ShinyHuntTools.h \
    Source/PokemonSwSh/Programs/ShinyHuntUnattended/PokemonSwSh_ShinyHuntUnattended-IoATrade.h \
    Source/PokemonSwSh/Programs/ShinyHuntUnattended/PokemonSwSh_ShinyHuntUnattended-Regi.h \
    Source/PokemonSwSh/Programs/ShinyHuntUnattended/PokemonSwSh_ShinyHuntUnattended-Regigigas2.h \
    Source/PokemonSwSh/Programs/ShinyHuntUnattended/PokemonSwSh_ShinyHuntUnattended-StrongSpawn.h \
    Source/PokemonSwSh/Programs/ShinyHuntUnattended/PokemonSwSh_ShinyHuntUnattended-SwordsOfJustice.h \
    Source/PokemonSwSh/Programs/DateSpamFarmers/PokemonSwSh_DateSpam-BerryFarmer.h \
    Source/PokemonSwSh/Programs/DateSpamFarmers/PokemonSwSh_DateSpam-DailyHighlightFarmer.h \
    Source/PokemonSwSh/Programs/DateSpamFarmers/PokemonSwSh_DateSpam-LotoFarmer.h \
    Source/PokemonSwSh/Programs/DateSpamFarmers/PokemonSwSh_DateSpam-StowOnSideFarmer.h \
    Source/PokemonSwSh/Programs/DateSpamFarmers/PokemonSwSh_DateSpam-WattFarmer.h \
    Source/PokemonSwSh/Programs/DenHunting/PokemonSwSh_BeamReset.h \
    Source/PokemonSwSh/Programs/DenHunting/PokemonSwSh_DaySkipperEU.h \
    Source/PokemonSwSh/Programs/DenHunting/PokemonSwSh_DaySkipperJPN-7.8k.h \
    Source/PokemonSwSh/Programs/DenHunting/PokemonSwSh_DaySkipperJPN.h \
    Source/PokemonSwSh/Programs/DenHunting/PokemonSwSh_DaySkipperUS.h \
    Source/PokemonSwSh/Programs/DenHunting/PokemonSwSh_EventBeamFinder.h \
    Source/PokemonSwSh/Programs/DenHunting/PokemonSwSh_PurpleBeamFinder.h \
    Source/PokemonSwSh/Programs/EggPrograms/PokemonSwSh_EggCombined2.h \
    Source/PokemonSwSh/Programs/EggPrograms/PokemonSwSh_EggCombinedShared.h \
    Source/PokemonSwSh/Programs/EggPrograms/PokemonSwSh_EggFetcher2.h \
    Source/PokemonSwSh/Programs/EggPrograms/PokemonSwSh_EggHatcher.h \
    Source/PokemonSwSh/Programs/EggPrograms/PokemonSwSh_EggHelpers.h \
    Source/PokemonSwSh/Programs/EggPrograms/PokemonSwSh_EggSuperCombined2.h \
    Source/PokemonSwSh/Programs/EggPrograms/PokemonSwSh_GodEggDuplication.h \
    Source/PokemonSwSh/Programs/EggPrograms/PokemonSwSh_GodEggItemDupe.h \
    Source/PokemonSwSh/Programs/Hosting/PokemonSwSh_AutoHost-MultiGame.h \
    Source/PokemonSwSh/Programs/Hosting/PokemonSwSh_AutoHost-Rolling.h \
    Source/PokemonSwSh/Programs/Hosting/PokemonSwSh_DenRoller.h \
    Source/PokemonSwSh/Programs/Hosting/PokemonSwSh_DenTools.h \
    Source/PokemonSwSh/Programs/Hosting/PokemonSwSh_LobbyWait.h \
    Source/PokemonSwSh/Programs/PokemonSwSh_RaidItemFarmerOKHO.h \
    Source/PokemonSwSh/Programs/PokemonSwSh_SynchronizedSpinning.h \
    Source/PokemonSwSh/Programs/QoLMacros/PokemonSwSh_FastCodeEntry.h \
    Source/PokemonSwSh/Programs/QoLMacros/PokemonSwSh_FriendSearchDisconnect.h \
    Source/PokemonSwSh/Programs/ReleaseHelpers.h \
    Source/PokemonSwSh/ShinyHuntTracker.h

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
