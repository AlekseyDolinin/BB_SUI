import Foundation

enum Endpoint {
    
    case getOptionsTenant
    case sendTenantCode(code: String)
    case checkUserInExperiment(experimentCode: String)
    case checkShowOrNotNotification(notificationType: String)
    case getUserStatistic(userID: Int)
    case leaveTeam(teamID: Int)
    case getArchiveQuests
    case getArchiveTowers
    case getArchiveLocations
    case getArchiveCompetitions
    case getArchiveCourses
    case getCategory(categoryID: Int)
    case getFolders(categoryID: Int)
    case getAgreements
    case readAgreements
    case getLocations
    case getDetailLocation(locationID: Int)
    case getDetailLocationArchive(locationID: Int)
    case getAssignedCourses
    case getEvents
    case getEvent(eventID: Int)
    case eventRequest(eventID: Int)
    case startEvent(eventID: Int)
    case finishEvent(eventID: Int)
    case rejectEvent(eventID: Int)
    case eventRevoke(eventRequestID: Int)
    case eventReject(eventRequestID: Int)
    case cancelAssignedCourse(courseID: Int)
    case updateAccount(userID: Int)
    case getEmployees
    case getEventsForFilter
    case getEventChainsForFilter
    case getEmployeesForInviteToEvent(eventID: Int)
    case requestsManageEvent(eventID: Int)
    case requestsManageSeriesEvent(eventChainID: Int)
    case getEventRequestsForCheck(eventID: Int)
    case sendStatusCheckRequest(eventID: Int)
    case getQuests
    case getQuestDetail(questID: Int)
    case getQuestDetailArchive(questID: Int)
    case getArchiveQuestTasks(questID: Int)
    case getQuestTasks(questID: Int)
    case getJobPositions
    case getGroups
    case getGroups_(userID: Int)
    case getSubdivisions
    case getSubdivisions_(userID: Int)
    case sendFBEvent(eventID: Int)
    case getDataQuestTaskDetailForStudent(taskID: Int)
    case getDataQuestTaskDetailForStudentFromArchive(taskID: Int)
    case getDataQuestTaskDetailForExpert(studentID: Int, taskID: Int)
    case startTaskFromQuest(taskID: Int)
    case getDetailTower(towerID: Int)
    case getDetailTowerArchive(towerID: Int)
    case getLeaderboardQuest(questID: Int)
    case getCommentsForStudent(taskID: Int)
    case getCommentsForExpert(studentID: Int, taskID: Int)
    case getStudentQuests(studentID: Int)
    case getCourses
    case getCategories
    case getCourseDetail(courseID: Int)
    case getCourseLearningDetail(courseID: Int, courseLearningID: Int)
    case getCourseAssignedDetail(courseID: Int)
    case getVideos
    case getTestingDetail(testingID: Int)
    case getTestingBlocks(testingID: Int)
    case getFilesOrLinks
    case getArticles
    case getTestings
    case getArticleDetail(articleID: Int)
    case getNotLibraryContent
    case sendTokens
    case getFBAfterBattle
    case getFBAfterRound
    case getUserData
    case clearDeviceInBack
    case getTags
    case sendSegmentsSeeVideo(videoID: Int)
    case getLanguageDictionary
    case restartTower(towerID: Int)
    case getLinkWebinar(eventID: Int)
    case getExpertsEvent
    case getExpertsEventsChain
    case startVideoStatistic(videoID: Int)
    case getOnboarding
    case sendIDsPagesOnboarding
    case getGuides
    case sendIDsPagesGuide
    case getColorShemeTenant
    case getModes
    case getStories
    case sendIDsPartsNewSee
    case checkAutoAssignment
    case getHint
    case markOnBackShowHint
    case getAvatars
    case changeAvatar(userID: Int)
    case lang
    case getMyLearning
    case getGameCurrencies
    case getListProducts
    case buyProducts(idProduct: Int)
    case getListWallets
    case getListOrders
    case getTransactions(idWallet: Int)
    case getCompetitions
    case getTowers
    case getMarathons
    case getMarathon(idMarathon: Int)
    case getStudents
    case startMarathon(idMarathon: Int)
    case getStage(idStage: Int)
    case getLottery(idLottery: Int)
    case sendMessageMarathonActivityStarts(objectID: Int)
    case getLinkModule(moduleID: Int)
    case getSertificates(userID: Int)
    case getCharacteristics
    case getCharacteristicDetail(id: Int)
    case getUserDataForAccount(userID: Int)
    case getUserActivity(userID: Int)
    case getRating
    case getCommunityListRating
    case getHistoryPointItems
    case getFilteredEmployees
    case getPrerequisites(activityType: String, activityID: Int)
    case getDataGraph
    case generateReport
    case getCategoriesForYou
    case getRecommendedContent
    case getListSelectedTypeActivity
    case generateReportXLSX
    case getReportsCompleted
    case getReportsPlayer(userID: Int)
    case getEmployeeActivityDiagram
    case getCompletedTrainingDiagram
    case getManagerOfficeEmployees
    case getDataCompetition(idCompetition: Int)
    case getTeamsCompetition(idCompetition: Int)
    case getDataTeam(idCompetition: Int, idTeam: Int)
    case joinTeam(idTeam: Int)
    case teamSession(sessionID: Int)
    case getArchiveCompetition(competitionID: Int)
    case getLeaderboardCompetitionArchive(competitionID: Int)
    case getStatisticTeamArchive(competitionID: Int, teamID: Int)
    case getCourseArchive
    case getRatingLocation(locationID: Int)
    case getLeaderboardTower(towerID: Int)
    case getLeaderboardCompetition(competitionID: Int)
    case getSearchLocations
    case getSearchEvents
    case getSearchTowers
    case getSearchQuests
    case getSearchCompetitions
    case getEventsForSignIn(playerID: Int)
    case eventRequestsForManage
    case eventChainRequestsForManage
    case getHistoryEventRequest(eventRequestID: Int)
    case getHistoryEventChainRequest(eventRequestID: Int)
    case sendNewStatusEventRequest
    case sendNewStatusEventChainRequest
    case getCategoriesForYou_v4
    case getDataReward
    case getAchievements(userID: Int)
    case getCommentsTaskFB(feedbackID: Int)
    case getFullDataVideo(videoID: Int)
    case sendCodeWord(idTask: Int)
    case sendTaskFB(idTask: Int)
    case sendTaskRate(idTask: Int)
    case avatarUpload
    case getTeamRatingCompetition(competitionID: Int, teamID: Int)
    case createTicket
    case getNotifications
    case getChat
    case getStudentQuest(studentID: Int, questID: Int)
    case competitionsTeamEdit(teamID: Int)
    case courseFeedback(courseID: Int)
    case checkIntersection(playerID: Int, eventID: Int)
    case getQuestsForSignIn
    case getCoursesForSignIn
    case getTestsForSignIn
    case createAppointment
    case getAppointmentsAssignedQuests
    case getAppointmentsAssignedCourses
    case getAppointmentsAssignedTests
    case deleteAppointmentAssignedCourse(appointmenID: Int)
    case deleteAppointmentAssignedQuest(appointmenID: Int)
    case saveAppointmentQuest(appointmenID: Int)
    case saveAppointmentCourse(appointmenID: Int)
    case saveAppointmentTest(appointmenID: Int)
    case getSeriesEventList
    case getResponsiblesSeriesEvent
    case eventChange(eventID: Int)
    case getSeriesEvent(seriesEventID: Int)
    case getSeriesEventEmployees(seriesEventID: Int)
    case sendRequestSeriesEvent(seriesEventID: Int)
    case revokeRequestEventChain(requestID: Int)
    case getLocationsSettings
    case getReportParameters(eventsChainsID: Int)
    case getQualityBlocksEventChain(eventsChainsID: Int)
    case getParticipantsEventChain(eventsChainsID: Int)
    case getParticipantDetailEventChain(eventsChainsID: Int, participantID: Int)
    case getDepartments
    case sendNewDataReport(eventsChainsID: Int)
    case generateReport_XLSX(eventsChainsID: Int)
    case checkStatusReport(idBackTask: String)
    case setSubscribe(userID: Int)
    case sendDataReport(eventsChainsID: Int)
    case reportForm(eventsChainsID: Int)
    case getPlayerCustomFields
    case getMyResultEventChain(eventsChainsID: Int)
    case completedTesting(idTesting: Int)
    case getWidgets
    
    
    
    
    public static func path(_ type: Endpoint) -> String {
        
        switch type {
           
            
        case .getWidgets:
            return LocalStorage.shared.url + "/game/api/v4/widgets/"
            
        case .completedTesting(let idTesting):
            return LocalStorage.shared.url + "/game/api/v4/testings/\(idTesting)/complete/"
            
        case .getMyResultEventChain(let eventsChainsID):
            return LocalStorage.shared.url + "/game/api/v4/events_chains/\(eventsChainsID)/result/"
            
        case .getPlayerCustomFields:
            return LocalStorage.shared.url + "/game/api/v4/player_custom_fields/"
            
        case .reportForm(let eventsChainsID):
            return LocalStorage.shared.url + "/game/api/v4/events_chains/\(eventsChainsID)/report/form/"
            
        case .sendDataReport(let eventsChainsID):
            return LocalStorage.shared.url + "/game/api/v4/events_chains/\(eventsChainsID)/report/save_row/"
            
        case .checkStatusReport(let idBackTask):
            return LocalStorage.shared.url + "/game/api/v4/celery/task/\(idBackTask)/result/"
            
        case .generateReport_XLSX(let eventsChainsID):
            return LocalStorage.shared.url + "/game/api/v4/events_chains/\(eventsChainsID)/report/generate_xlsx/"
            
        case .sendNewDataReport(let eventsChainsID):
            return LocalStorage.shared.url + "/game/api/v4/events_chains/\(eventsChainsID)/report/save/"
            
        case .getDepartments:
            return LocalStorage.shared.url + "/game/api/v4/departments/"
            
        case .getParticipantDetailEventChain(let eventsChainsID, let participantID):
            return LocalStorage.shared.url + "/game/api/v4/events_chains/\(eventsChainsID)/participants/\(participantID)/"
            
        case .getParticipantsEventChain(let eventsChainsID):
            return LocalStorage.shared.url + "/game/api/v4/events_chains/\(eventsChainsID)/participants/"
            
        case .getQualityBlocksEventChain(let eventsChainsID):
            return LocalStorage.shared.url + "/game/api/v4/events_chains/\(eventsChainsID)/quality_blocks/"
            
        case .getReportParameters(let eventsChainsID):
            return LocalStorage.shared.url + "/game/api/v4/events_chains/\(eventsChainsID)/report_param/"
            
        case .getLocationsSettings:
            return LocalStorage.shared.url + "/game/api/v4/locations/settings/"
            
        case .revokeRequestEventChain(let requestID):
            return LocalStorage.shared.url + "/game/api/v4/events_chain_request/\(requestID)/revoke/"
                        
        case .sendRequestSeriesEvent(let seriesEventID):
            return LocalStorage.shared.url + "/game/api/v4/events_chains/\(seriesEventID)/request/"
            
        case .getSeriesEventEmployees(let seriesEventID):
            return LocalStorage.shared.url + "/game/api/v4/events_chains/\(seriesEventID)/employees/"
            
        case .getSeriesEvent(let seriesEventID):
            return LocalStorage.shared.url + "/game/api/v4/events_chains/\(seriesEventID)/"
            
        case .eventChange(let eventID):
            return LocalStorage.shared.url + "/game/api/v4/event/\(eventID)/change/"
            
        case .getResponsiblesSeriesEvent:
            return LocalStorage.shared.url + "/game/api/v4/events_chain_experts/"
            
        case .getSeriesEventList:
            return LocalStorage.shared.url + "/game/api/v4/events_chains/"
            
        case .saveAppointmentQuest(let appointmenID):
            return LocalStorage.shared.url + "/game/api/v6/appointments/player_quest/\(appointmenID)/update/"
            
        case .saveAppointmentCourse(let appointmenID):
            return LocalStorage.shared.url + "/game/api/v6/appointments/player_quest/\(appointmenID)/update/"
            
        case .saveAppointmentTest(let appointmenID):
            return LocalStorage.shared.url + "/game/api/v6/appointments/player_quest/\(appointmenID)/update/"
            
        case .deleteAppointmentAssignedCourse(let appointmenID):
            return LocalStorage.shared.url + "/game/api/v6/appointments/course_learning/\(appointmenID)/delete/"
            
        case .deleteAppointmentAssignedQuest(let appointmenID):
            return LocalStorage.shared.url + "/game/api/v6/appointments/player_quest/\(appointmenID)/delete/"
            
        case .getAppointmentsAssignedQuests:
            return LocalStorage.shared.url + "/game/api/v6/appointments/assigned_quests/"
            
        case .getAppointmentsAssignedCourses:
            return LocalStorage.shared.url + "/game/api/v6/appointments/assigned_courses/"
            
        case .getAppointmentsAssignedTests:
            return LocalStorage.shared.url + "/game/api/v6/appointments/assigned_tests/"
            
        case .createAppointment:
            return LocalStorage.shared.url + "/game/api/v6/appointments/appoint/"
            
        case .getQuestsForSignIn:
            return LocalStorage.shared.url + "/game/api/v6/appointments/avalible_quests/"
            
        case .getCoursesForSignIn:
            return LocalStorage.shared.url + "/game/api/v6/appointments/avalible_courses/"
            
        case .getTestsForSignIn:
            return LocalStorage.shared.url + "/game/api/v6/appointments/avalible_tests/"
            
        case .checkIntersection(let playerID, let eventID):
            return LocalStorage.shared.url + "/game/api/v4/player/\(playerID)/events/\(eventID)/check_intersection/"
            
        case .courseFeedback(let courseID):
            return LocalStorage.shared.url + "/game/api/v3/courses/\(courseID)/feedback/"

        case .competitionsTeamEdit(let teamID):
            return LocalStorage.shared.url + "/game/api/v4/competitions/team/\(teamID)/edit/"
            
        case .getStudentQuest(let studentID, let questID):
            return LocalStorage.shared.url + "/game/api/v4/students/\(studentID)/quest/\(questID)/"
            
        case .getChat:
            return LocalStorage.shared.url + "/game/api/v3/chat/"
            
        case .getNotifications:
            return LocalStorage.shared.url + "/game/api/v4/notifications/"
            
        case .createTicket:
            return LocalStorage.shared.url + "/game/api/v4/create_ticket/"
            
        case .getTeamRatingCompetition(let competitionID, let teamID):
            return LocalStorage.shared.url + "/game/api/v4/competitions/\(competitionID)/team/\(teamID)/leaderboard/"
            
        case .avatarUpload:
            return LocalStorage.shared.url + "/game/api/v4/avatars/upload/"
            
        case .sendCodeWord(let idTask):
            return LocalStorage.shared.url + "/game/api/v4/tasks/code_word/\(idTask)/"
            
        case .sendTaskFB(let idTask):
            return LocalStorage.shared.url + "/game/api/v4/tasks/\(idTask)/feedback/"
            
        case .sendTaskRate(let idTask):
            return LocalStorage.shared.url + "/game/api/v4/tasks/\(idTask)/rating_scale/"
            
        case .getFullDataVideo(let videoID):
            return LocalStorage.shared.url + "/game/api/v4/videos/\(videoID)/"
            
        case .getCommentsTaskFB(let feedbackID):
            return LocalStorage.shared.url + "/game/api/v4/feedback/\(feedbackID)/comments/"
            
        case .getAchievements(let playerID):
            return LocalStorage.shared.url + "/game/api/v4/player/\(playerID)/achievements/"
            
        case .getDataReward:
            return LocalStorage.shared.url + "/game/api/v4/tournaments/show_reward/"
            
        case .getCategoriesForYou_v4:
            return LocalStorage.shared.url + "/game/api/v4/categories/for_you/"
            
        case .sendNewStatusEventRequest:
            return LocalStorage.shared.url + "/game/api/v4/manager_office/event_requests/manage/"
            
        case .sendNewStatusEventChainRequest:
            return LocalStorage.shared.url + "/game/api/v4/manager_office/events_chain_requests/manage/"
            
        case .getHistoryEventRequest(let eventRequestID):
            return LocalStorage.shared.url + "/game/api/v4/event_request/\(eventRequestID)/history/"
            
        case .getHistoryEventChainRequest(let eventChainRequestID):
            return LocalStorage.shared.url + "/game/api/v4/events_chain_request/\(eventChainRequestID)/history/"
            
        case .eventRequestsForManage:
            return LocalStorage.shared.url + "/game/api/v4/manager_office/event_requests/"
            
        case .eventChainRequestsForManage:
            return LocalStorage.shared.url + "/game/api/v4/manager_office/events_chain_requests/"

        case .getEventsForSignIn(let playerID):
            return LocalStorage.shared.url + "/game/api/v4/player/\(playerID)/events/"
            
        case .getSearchTowers:
            return LocalStorage.shared.url + "/game/api/v4/search_tournaments/"
            
        case .getSearchQuests:
            return LocalStorage.shared.url + "/game/api/v4/search_quests/"
            
        case .getSearchCompetitions:
            return LocalStorage.shared.url + "/game/api/v4/search_competitions/"
            
        case .getSearchEvents:
            return LocalStorage.shared.url + "/game/api/v4/search_events/"
            
        case .getSearchLocations:
            return LocalStorage.shared.url + "/game/api/v4/search_arenas/"
            
        case .getLeaderboardCompetition(let competitionID):
            return LocalStorage.shared.url + "/game/api/v4/competitions/\(competitionID)/leaderboard/"
            
        case .getLeaderboardTower(let towerID):
            return LocalStorage.shared.url + "/game/api/v4/tournaments/\(towerID)/leaderboard/"
            
        case .getRatingLocation(let locationID):
            return LocalStorage.shared.url + "/game/api/v4/arena/\(locationID)/leaderboard"
            
        case .getStatisticTeamArchive(let competitionID, let teamID):
            return LocalStorage.shared.url + "/game/api/v4/archive/competitions/\(competitionID)/team/\(teamID)/leaderboard/"
            
        case .getLeaderboardCompetitionArchive(let competitionID):
            return LocalStorage.shared.url + "/game/api/v4/archive/competitions/\(competitionID)/leaderboard/"
            
        case .getArchiveCompetition(let competitionID):
            return LocalStorage.shared.url + "/game/api/v4/archive/competitions/\(competitionID)/"
            
        case .teamSession(let sessionID):
            return LocalStorage.shared.url + "/game/api/v4/competitions/team_session/\(sessionID)/results/"
            
        case .joinTeam(let idTeam):
            return LocalStorage.shared.url + "/game/api/v4/competitions/team/\(idTeam)/join/"
            
        case .getDataTeam(let idCompetition, let idTeam):
            return LocalStorage.shared.url + "/game/api/v4/competitions/\(idCompetition)/team/\(idTeam)/"
            
        case .getTeamsCompetition(let idCompetition):
            return LocalStorage.shared.url + "/game/api/v4/competitions/\(idCompetition)/teams/"
            
        case .getDataCompetition(let idCompetition):
            return LocalStorage.shared.url + "/game/api/v4/competitions/\(idCompetition)/"
            
        case .getManagerOfficeEmployees:
            return LocalStorage.shared.url + "/game/api/v4/manager_office/employees/"
            
        case .getCompletedTrainingDiagram:
            return LocalStorage.shared.url + "/game/api/v4/manager_office/completed_training/diagram/"
            
        case .getEmployeeActivityDiagram:
            return LocalStorage.shared.url + "/game/api/v4/manager_office/employee_activity/diagram/"
            
        case .getReportsPlayer(let userID):
            return LocalStorage.shared.url + "/game/api/v4/manager_office/player/\(userID)/report/"
            
        case .getReportsCompleted:
            return LocalStorage.shared.url + "/game/api/v4/manager_office/reports/"
            
        case .generateReportXLSX:
            return LocalStorage.shared.url + "/game/api/v4/manager_office/generate_report/xlsx/"
            
        case .getListSelectedTypeActivity:
            return LocalStorage.shared.url + "/game/api/v4/manager_office/report/filter_objects/"
            
        case .getRecommendedContent:
            return LocalStorage.shared.url + "/game/api/v5/recommended_content/"
            
        case .getCategoriesForYou:
            return LocalStorage.shared.url + "/game/api/v5/categories/for_you/"
            
        case .generateReport:
            return LocalStorage.shared.url + "/game/api/v4/manager_office/generate_report/"
            
        case .getDataGraph:
            return LocalStorage.shared.url + "/game/api/v4/manager_office/employee_activity/graph/"
            
        case .getPrerequisites(let activityType, let activityID):
            return LocalStorage.shared.url + "/game/api/v6/prerequisites/\(activityType)/\(activityID)/"
            
        case .getFilteredEmployees:
            return LocalStorage.shared.url + "___"
            
        case .getHistoryPointItems:
            return LocalStorage.shared.url + "/game/api/v5/score_history/"
            
        case .getCommunityListRating:
            return LocalStorage.shared.url + "/game/api/v5/rating_communities/"
            
        case .getRating:
            return LocalStorage.shared.url + "/game/api/v5/rating/"
            
        case .getUserActivity(let userID):
            return LocalStorage.shared.url + "/game/api/v4/player/\(userID)/activity/"
            
        case .getUserDataForAccount(let userID):
            return LocalStorage.shared.url + "/game/api/v4/player/\(userID)/"
            
        case .getCharacteristicDetail(let id):
            return LocalStorage.shared.url + "/game/api/v4/characteristics/\(id)/"
            
        case .getCharacteristics:
            return LocalStorage.shared.url + "/game/api/v4/characteristics/"
            
        case .getSertificates(let userID):
            return LocalStorage.shared.url + "/game/api/v4/player/\(userID)/certificates/"
            
        case .getLinkModule(let moduleID):
            return LocalStorage.shared.url + "/game/api/v4/course_module/\(moduleID)/start_url/"
            
        case .sendMessageMarathonActivityStarts(let objectID):
            return LocalStorage.shared.url + "/game/api/v4/marathon_activities/\(objectID)/start/"
            
        case .getLottery(let idLottery):
            return LocalStorage.shared.url + "/game/api/v4/lottery_reward/\(idLottery)/"
            
        case .getStage(let idStage):
            return LocalStorage.shared.url + "/game/api/v4/marathon_stages/\(idStage)/"
            
        case .startMarathon(let idMarathon):
            return LocalStorage.shared.url + "/game/api/v4/marathons/\(idMarathon)/start/"
            
        case .getStudents:
            return LocalStorage.shared.url + "/game/api/v5/students/"
            
        case .getMarathon(let idMarathon):
            return LocalStorage.shared.url + "/game/api/v4/marathons/\(idMarathon)/"
            
        case .getMarathons:
            return LocalStorage.shared.url + "/game/api/v4/marathons/"
            
        case .getTowers:
            return LocalStorage.shared.url + "/game/api/v4/tournaments/"
            
        case .getCompetitions:
            return LocalStorage.shared.url + "/game/api/v4/competitions/"
            
        case .getTransactions(let idWallet):
            return LocalStorage.shared.url + "/game/api/v4/player_account/\(idWallet)/"
            
        case .getListOrders:
            return LocalStorage.shared.url + "/game/api/v4/orders/"
            
        case .getListWallets:
            return LocalStorage.shared.url + "/game/api/v4/player_accounts/"
            
        case .buyProducts(let idProduct):
            return LocalStorage.shared.url + "/game/api/v4/product/\(idProduct)/buy/"
            
        case .getListProducts:
            return LocalStorage.shared.url + "/game/api/v4/products/"
            
        case .getGameCurrencies:
            return LocalStorage.shared.url + "/game/api/v4/currencies/"
            
        case .getMyLearning:
            return LocalStorage.shared.url + "/game/api/v4/compulsory_education/"
            
        case .lang:
            return LocalStorage.shared.url + "/game/api/v3/lang/"
            
        case .changeAvatar(let userID):
            return LocalStorage.shared.url + "/game/api/v3/change_avatar/\(userID)/"
            
        case .getAvatars:
            return LocalStorage.shared.url + "/game/api/v3/avatars/"
            
        case .getCategories:
            return LocalStorage.shared.url + "/game/api/v5/categories/"
            
        case .getHint:
            return LocalStorage.shared.url + "/game/api/v4/hint/"
            
        case .markOnBackShowHint:
            return LocalStorage.shared.url + "/game/api/v4/hint/cancel/"
            
        case .getJobPositions:
            return LocalStorage.shared.url + "/game/api/v4/positions/"
            
        case .getGroups:
            return LocalStorage.shared.url + "/game/api/v4/communities/"
            
        case .getGroups_(let userID):
            return LocalStorage.shared.url + "/game/api/v4/player/\(userID)/communities/"
            
        case .getSubdivisions:
            return LocalStorage.shared.url + "/game/api/v4/subdivisions/"
            
        case .getSubdivisions_(let userID):
            return LocalStorage.shared.url + "/game/api/v4/player/\(userID)/subdivisions/"
            
        case .requestsManageEvent(let eventID):
            return LocalStorage.shared.url + "/game/api/v4/event/\(eventID)/event_requests/manage/"
            
        case .requestsManageSeriesEvent(let eventChainID):
            return LocalStorage.shared.url + "/game/api/v4/events_chains/\(eventChainID)/requests/manage/"
            
        case .checkAutoAssignment:
            return LocalStorage.shared.url + "/game/api/v4/auto_assignment/"
            
        case .sendIDsPartsNewSee:
            return LocalStorage.shared.url + "/game/api/v4/mark_news_parts/"
            
        case .getColorShemeTenant:
            return LocalStorage.shared.url + "/game/api/v4/color_scheme/"
            
        case .getGuides:
            return LocalStorage.shared.url + "/game/api/v4/guides/"
            
        case .getOnboarding:
            return LocalStorage.shared.url + "/game/api/v4/onboarding/"
            
        case .sendIDsPagesOnboarding:
            return LocalStorage.shared.url + "/game/api/v4/onboarding/cancel/"
            
        case .getGuides:
            return LocalStorage.shared.url + "/game/api/v4/guides/"
            
        case .getModes:
            return LocalStorage.shared.url + "/game/api/v5/trial/"
            
        case .getStories:
            return LocalStorage.shared.url + "/game/api/v4/news/"
            
        case .sendIDsPagesGuide:
            return LocalStorage.shared.url + "/game/api/v4/guides/cancel/"
            
        case .getOptionsTenant:
            return LocalStorage.shared.url + "/api/options/"
            
        case .getUserData:
            return LocalStorage.shared.url + "/api/get_user_data/"
            
        case .startVideoStatistic(let videoID):
            return LocalStorage.shared.url + "/game/api/v5/video/\(videoID)/start/"
            
        case .restartTower(let towerID):
            return LocalStorage.shared.url + "/game/api/v4/tournament/\(towerID)/restart/"
            
        case .getLanguageDictionary:
            return LocalStorage.shared.url + "/game/api/v6/get_language_dictionary/"
            
        case .sendSegmentsSeeVideo(let videoID):
            return LocalStorage.shared.url + "/game/api/v5/video/\(videoID)/"
            
        case .getLinkWebinar(let eventID):
            return LocalStorage.shared.url + "/game/api/v4/event/\(eventID)/webinar_url/"
            
        case .getExpertsEvent:
            return LocalStorage.shared.url + "/game/api/v4/event_experts/"
          
        case .getExpertsEventsChain:
            return LocalStorage.shared.url + "/game/api/v4/events_chain_experts/"
            
        case .clearDeviceInBack:
            return LocalStorage.shared.url + "/game/api/v3/players/device_clear/"
            
        case .sendTokens:
            return LocalStorage.shared.url + "/game/api/v3/players/device_token_update/"
            
        case .getTags:
            return LocalStorage.shared.url + "/game/api/v4/tags/"
            
        case .getDataQuestTaskDetailForExpert(let studentID, let taskID):
            return LocalStorage.shared.url + "/game/api/v4/students/\(studentID)/task/\(taskID)/"
            
        case .getFBAfterBattle:
            guard let url = URL(string: BattleSocket.shared.getLinkBSocket()) else { return "" }
            let id = url.pathComponents.last ?? ""
            return LocalStorage.shared.url + "/game/api/v5/battle_answers_detail/\(id)/"
                        
        case .getFBAfterRound:
            guard let url = URL(string: BattleSocket.shared.getLinkBSocket()) else { return "" }
            let id = url.pathComponents.last ?? ""
            return LocalStorage.shared.url + "/game/api/v5/round_answers_detail/\(id)/"
            
        case .getNotLibraryContent:
            return LocalStorage.shared.url + "/game/api/v4/not_library_content/"
            
        case .getArticleDetail(let articleID):
            return LocalStorage.shared.url + "/game/api/v4/articles/\(articleID)/"
            
        case .getCourses:
            return LocalStorage.shared.url + "/game/api/v5/courses/"
            
        case .getCourseDetail(let courseID):
            return LocalStorage.shared.url + "/game/api/v3/courses/\(courseID)/"
            
        case .getTestingDetail(let testingID):
            return LocalStorage.shared.url + "/game/api/v4/testings/\(testingID)/"
                     
        case .getTestingBlocks(let testingID):
            return LocalStorage.shared.url + "/game/api/v4/testings/\(testingID)/parts/"
            
        case .getCourseLearningDetail(let courseID, let courseLearningID):
            return LocalStorage.shared.url + "/game/api/v3/courses/\(courseID)/course_learning/\(courseLearningID)/"
            
        case .getCourseAssignedDetail(let courseID):
            return LocalStorage.shared.url + "/game/api/v4/assigned_courses/\(courseID)/"
            
        case .getVideos:
            return LocalStorage.shared.url + "/game/api/v5/videos/"
            
        case .getFilesOrLinks:
            return LocalStorage.shared.url + "/game/api/v4/materials/"
            
        case .getArticles:
            return LocalStorage.shared.url + "/game/api/v4/articles/"
            
        case .getTestings:
            return LocalStorage.shared.url + "/game/api/v4/testings/"
            
        case .getCommentsForStudent(let taskID):
            return LocalStorage.shared.url + "/game/api/v3/task/\(taskID)/messages/?offset=\(0)&limit=\(500)&order=desc"
            
        case .getCommentsForExpert(let studentID, let taskID):
            return LocalStorage.shared.url + "/game/api/v3/my_students/\(studentID)/task/\(taskID)/messages/?offset=\(0)&limit=\(500)&order=desc"
            
        case .getStudentQuests(let studentID):
            return LocalStorage.shared.url + "/game/api/v4/students/\(studentID)/"
            
        case .getEvents:
            return LocalStorage.shared.url + "/game/api/v4/events/"
            
        case .getDetailTower(let towerID):
            return LocalStorage.shared.url + "/game/api/v4/tournaments/\(towerID)/"
            
        case .getDetailTowerArchive(let towerID):
            return LocalStorage.shared.url + "/game/api/v4/archive/tournaments/\(towerID)/"
            
        case .getLeaderboardQuest(let questID):
            return LocalStorage.shared.url + "/game/api/v4/quests/\(questID)/leaderboard/"
            
        case .sendFBEvent(let eventID):
            return LocalStorage.shared.url + "/game/api/v4/event/\(eventID)/feedback/"
            
        case .getDataQuestTaskDetailForStudent(let taskID):
            return LocalStorage.shared.url + "/game/api/v6/task/\(taskID)/"
            
        case .getDataQuestTaskDetailForStudentFromArchive(let taskID):
            return LocalStorage.shared.url + "/game/api/v5/archive/tasks/\(taskID)/"
            
        case .startTaskFromQuest(let taskID):
            return LocalStorage.shared.url + "/game/api/v6/task/\(taskID)/"
            
        case .getEvent(let eventID):
            return LocalStorage.shared.url + "/game/api/v4/event/\(eventID)/"
            
        case .getQuests:
            return LocalStorage.shared.url + "/game/api/v6/quests/"
            
        case .getQuestDetail(let questID):
            return LocalStorage.shared.url + "/game/api/v6/quest/\(questID)/"
            
        case .getQuestTasks(let questID):
            return LocalStorage.shared.url + "/game/api/v6/quest/\(questID)/tasks/"
            
        case .getQuestDetailArchive(let questID):
            return LocalStorage.shared.url + "/game/api/v4/archive/quests/\(questID)/"
            
        case .getArchiveQuestTasks(let questID):
            return LocalStorage.shared.url + "/game/api/v5/archive/quests/\(questID)/tasks/"
            
        case .sendStatusCheckRequest(let eventID):
            return LocalStorage.shared.url + "/game/api/v4/event/\(eventID)/presences/"
            
        case .eventRequest(let eventID):
            return LocalStorage.shared.url + "/game/api/v4/event/\(eventID)/event_request/"
            
        case .startEvent(let eventID):
            return LocalStorage.shared.url + "/game/api/v4/event/\(eventID)/start/"
            
        case .finishEvent(let eventID):
            return LocalStorage.shared.url + "/game/api/v4/event/\(eventID)/finish/"
            
        case .rejectEvent(let eventID):
            return LocalStorage.shared.url + "/game/api/v4/event/\(eventID)/reject/"
            
        case .eventRevoke(let eventRequestID):
            return LocalStorage.shared.url + "/game/api/v4/event_request/\(eventRequestID)/revoke/"
            
        case .eventReject(let eventRequestID):
            return LocalStorage.shared.url + "/game/api/v4/event_request/\(eventRequestID)/reject/"
            
        case .getEmployees:
            return LocalStorage.shared.url + "/game/api/v4/employees/"
            
        case .getEventsForFilter:
            return LocalStorage.shared.url + "/game/api/v4/manager_office/event_requests/events/"
            
        case .getEventChainsForFilter:
            return LocalStorage.shared.url + "/game/api/v4/manager_office/events_chain_requests/events_chain/"
            
        case .getEmployeesForInviteToEvent(let eventID):
            return LocalStorage.shared.url + "/game/api/v4/event/\(eventID)/employees/"
            
        case .getEventRequestsForCheck(let eventID):
            return LocalStorage.shared.url + "/game/api/v4/event/\(eventID)/event_requests/"
            
        case .sendTenantCode(let code):
            if code.prefix(5) == "test-" {
                return ("http://auth-test.boxbattle.ru/tenant-search/?code=\(code)").encodeUrl
            } else if code.prefix(4) == "pre-" {
                return ("http://auth-pre.boxbattle.ru/tenant-search/?code=\(code)").encodeUrl
            } else {
                return ("http://auth.boxbattle.ru/tenant-search/?code=\(code)").encodeUrl
            }
            
        case .checkUserInExperiment(let experimentCode):
            return LocalStorage.shared.url + "/game/api/v4/experiment_participation/\(experimentCode)/"
            
        case .checkShowOrNotNotification(let notificationType):
            return LocalStorage.shared.url + "/game/api/v4/notification/\(notificationType)/"
            
        case .leaveTeam(let teamID):
            return LocalStorage.shared.url + "/game/api/v4/competitions/team/\(teamID)/leave/"
            
        case .getUserStatistic(let userID):
            return LocalStorage.shared.url + "/game/api/v2/player/\(userID)/statistics"
            
        case .getArchiveQuests:
            return LocalStorage.shared.url + "/game/api/v4/archive/quests/"
            
        case .getArchiveTowers:
            return LocalStorage.shared.url + "/game/api/v4/archive/tournaments/"
            
        case .getArchiveLocations:
            return LocalStorage.shared.url + "/game/api/v4/archive/arenas/"
            
        case .getArchiveCompetitions:
            return LocalStorage.shared.url + "/game/api/v4/archive/competitions/"
            
        case .getArchiveCourses:
            return LocalStorage.shared.url + "/game/api/v4/assigned_courses/"
            
        case .getCategory(let categoryID):
            return LocalStorage.shared.url + "/game/api/v5/categories/\(categoryID)/"
            
        case .getFolders(let categoryID):
            return LocalStorage.shared.url + "/game/api/v4/category/\(categoryID)/subcategories/"
            
        case .getAgreements:
            return LocalStorage.shared.url + "/game/api/v4/legal_agreements/"
            
        case .readAgreements:
            return LocalStorage.shared.url + "/game/api/v4/legal_agreements/"
            
        case .getLocations:
            return LocalStorage.shared.url + "/game/api/v4/locations/"
            
        case .getDetailLocation(let locationID):
            return LocalStorage.shared.url + "/game/api/v4/locations/\(locationID)/"
            
        case .getDetailLocationArchive(let locationID):
            return LocalStorage.shared.url + "/game/api/v4/archive/arenas/\(locationID)/"
            
        case .getAssignedCourses:
            return LocalStorage.shared.url + "/game/api/v4/assigned_courses/"
            
        case .cancelAssignedCourse(let courseID):
            return LocalStorage.shared.url + "/game/api/v4/assigned_courses/\(courseID)/cancel/"
            
        case .updateAccount(let userID):
            return LocalStorage.shared.url + "/api/user_rename/\(userID)/"
            
        case .setSubscribe(let userID):
            return LocalStorage.shared.url + "/api/user_rename/\(userID)/"
            
        default:
            return ""
        }
    }
}
