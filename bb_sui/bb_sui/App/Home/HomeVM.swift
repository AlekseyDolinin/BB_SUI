import SwiftUI
import SwiftyJSON

extension HomeView {
    
    @Observable
    class ViewModel {
        
        let dict = AppLanguage.shared.dict
        
        var widgets = [Widget]()
        var marathons = [Marathon]()
        var storiesPinned = [Story]()
        var storiesBasic = [Story]()
        var myLearning = [MyLearning]()
//
        enum TypeCellMyLearning {
            case plate
            case line
        }
        var typeCellMyLearning: TypeCellMyLearning = .plate
        
        var pageMyLearning = 1
        var totalMyLearning = 0
        
        func getData() {
            myLearning.removeAll()
            pageMyLearning = 1
            totalMyLearning = 0
            //
            Task(priority: .userInitiated) {
                await getWidgets()
                await getMarathons()
                await getStories()
                await getMyLearning()
            }
        }
        
        private func getWidgets() async {
            let link = Endpoint.path(.getWidgets)
            let response = await API.shared._request(link)
            if let json = response?.json {
                widgets.removeAll()
                for i in json.arrayValue {
                    let widget = Widget()
                    widget.parse(json: i)
                    widgets.append(widget)
                }
            }
        }
        
        private func getMarathons() async {
            let parameters: [String : Any] = ["marathon_statuses": ["in_progress"]]
            let link = Endpoint.path(.getMarathons)
            let response = await API.shared._request(link, method: .post, parameters: parameters)
            if let json = response?.json {
                for i in json["marathons"].arrayValue {
                    let marathon = Marathon()
                    await marathon.parse(json: i)
                    marathons.append(marathon)
                }
            }
        }
        
        private func getStories() async {
            let link = Endpoint.path(.getStories)
            let response = await API.shared._request(link)
            if let json = response?.json {
                storiesPinned.removeAll()
                storiesBasic.removeAll()
                for i in json.arrayValue {
                    let story = Story()
                    story.parseStory(json: i)
                    if story.isPin {
                        storiesPinned.append(story)
                    } else {
                        storiesBasic.append(story)
                    }
                }
            }
        }

        private func getMyLearning() async {
            let parameters: [String : Any] = [
                "page": pageMyLearning,
                "object_types": ""
            ]
            let link = Endpoint.path(.getMyLearning)
            let response = await API.shared._request(link, method: .post, parameters: parameters)
            if let json = response?.json {
                print(json)
                totalMyLearning = json["total"].intValue
                for i in json["objects"].arrayValue {
                    let content = MyLearning()
                    await content.parse(json: i)
                    myLearning.append(content)
                }
            }
        }
        
        
//        private func getObjectTypes() -> [String] {
//            var types: [String] = []
//            if filters.quests == true {
//                types.append("quest")
//            }
//            if filters.courses == true {
//                types.append("course")
//            }
//            if filters.towers == true {
//                types.append("tournament")
//            }
//            if filters.events == true {
//                types.append("event")
//            }
//            if filters.eventSeries == true {
//                types.append("events_chain")
//            }
//            if filters.testing == true {
//                types.append("testing")
//            }
//            return types
//        }
    }
}
