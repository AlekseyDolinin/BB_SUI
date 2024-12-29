
enum TypeObject: String, CaseIterable {
    case url = "url"
    case file = "file"
    case course = "course"
    case assignedCourses = "assignedCourses"
    case programm = "programm"
    case arenaWin = "arenaWin"
    case arena = "arena"
    case mountainWin = "mountainWin"
    case mountain = "mountain"
    case check = "check"
    case video = "video"
    case codeWord = "codeWord"
    case tower = "tower"
    case fb = "fb"
    case rate = "rate"
    case article = "article"
    case event = "event"
    case eventChain = "eventsChain"
    case quest = "quest"
    case competition = "competition"
    case testing = "testing"
    case marathons = "marathons"
    case material = "material"
    case task = "task"
    case round = "round"
    case groups = "groups"
    case subdivisions = "subdivisions"
    case users = "users"
    case jobposition = "jobposition"
    case expertsEvent = "expertsEvent"
    case expertsEventsChain = "expertsEventsChain"
    case departament
    case locations = "locations"
    case unknown = "unknown"
}

enum EventRequestStatus: String {
    case onApproval = "on_approval"
    case approved = "approved"
    case rejected = "rejected"
    case reserved = "reserved"
    case revoked = "revoked"
    case noRequest = "no_request"
    case notAccess = "not_access"
    case hasPrerequisites = "has_prerequisites"
    case approvedByManager = "approved_by_manager"
    case rejectedByAdmin = "rejectedByAdmin"
    case none = "none"
}

enum TypeGames: String, CaseIterable {
    case towers = "towerGames"
    case competitions = "competitionsGames"
    case quests = "questGames"
    case marathons = "marathonGames"
    case locations = "locationGames"
}

enum StatusObject: String {
    case notStarted
    case inProgress = "inProgress"
    case success
    case failure
    case blocked
    case rewardGained
    case skipped
    case completed = "completed"
    case new
    case error
    case planned = "planned"
    case rejected = "rejected"
    case canceled = "canceled"
    case none = "none"
}

enum TypeQuestion {
    case single
    case multi
    case ranking
    case matching
    /// много инпутов
    case inputEqualsAll
    /// один инпут
    case inputEqualsAny
    case inputContainsAny
    case inputContainsAll
    case unowned
}

enum ForceNavigationStories {
    case nextSectionStory
    case prewSectionStory
    case currentSectionStartAgain
    case none
}

// ========================================================================================


enum SortingType: String {
    case fullname = "fullname"
    case quest = "quest"
    case course = "course"
    case test = "test"
    case eventName = "event_name"
    case eventsChainName = "events_chain_name"
}

enum SortingOrder: String {
    case asc = "asc"
    case desc = "desc"
}

enum OrderBy: String {
    // очки
    case score = "score"
    // верные ответы
    case correctAnswers = "correct_answers"
    // победы
    case win = "1"
    // очки
    case point = "2"
}

enum OrderType: String {
    // по убыванию
    case desc = "1"
    // по возрастанию
    case asc = "2"
}


// ========================================================================================


enum UserRole: String {
    case isExpert
    case isStudent
    case trainingAdmin
    case instructor
    case expert = "expert"
    case manager = "manager"
    case playerBasic = "player"
    case none = "none"
}


// ========================================================================================


enum Operation {
    case plus
    case minus
}

enum TypeForTime: String {
    case expiring = "expiring"
    case rest = "rest"
    case none = "none"
}

enum UserState: Comparable {
    case ready
    case online
    case chosen
    case offline
    case battleLocation
    case battleTower
    case battleCompetition
    case call
    case accepted
    case gathering
    case busy
    case observer
    case none
}

enum TypeSocketConnect {
    case battleLocation(link: String)
    case battleTower(link: String)
    case battleCompetition(link: String)
    case spectator(link: String)
}

enum Reaction: String {
    case disagree = "disagree"
    case doubt = "doubt"
    case agree = "agree"
}

enum TypeCallOpponentInBattle: String {
    case call = "call"
    case invite = "invite"
    case none = "none"
}

enum AgreementType {
    case consent
    case familiarized
    case none
}


// ========================================================================================


enum AttendedStatusEvent: String {
    case notAttended = "not_attended"
    case attended = "attended"
    case semiAttended = "semi_attended"
}

enum EventType: String {
    case online = "online"
    case offline = "offline"
}

enum TypeViewContent {
    case plate
    case line
}

enum ActionRequestsManage: String {
    case apply = "apply"
    case reject = "reject"
}

enum CertificateCondition {
    case all
    case required
    case selected
    case completed
    case presence
}
