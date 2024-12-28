import SwiftyJSON
import UIKit

class Video {
        
    var id: Int = 0
    var videoID: Int = 0
    var name: String = ""
    var durationMS: Int = 0
    var description: String = " "
    var status: Status = .notStarted
    var createDate: String = ""
    var poster: UIImage = UIImage(named: "phCourse") ?? UIImage()
    var posterDetail: UIImage = UIImage()
    var videoLink: String = ""
    var service: ServiceVideo = .kinescope
    var progress: Int = 0
    var timestamps = [[Int]]()
    
    enum ServiceVideo: String {
        case webcaster = "webcaster"
        case kinescope = "kinescope"
    }
    
    enum Status {
        case notStarted
        case inProgress
        case success
        case failure
        case blocked
        case completed
    }
    
    func openDetail() {
        DispatchQueue.main.async {
//            let vc = VideoDetailVC(video: self)
//            vc.hidesBottomBarWhenPushed = true
//            GetCurrentVC.get_().navigationController?.pushViewController(vc, animated: true)
        }
    }
}


extension Video {
    
    func parse(json: JSON) async {
        id = json["id"].intValue
        videoID = json["video_id"].intValue
        name = json["name"].stringValue
        durationMS = json["time"].intValue
        description = json["description"].stringValue
        status = parseStatus(input: json["status"].stringValue)
        createDate = json["create_date"].stringValue
        progress = json["progress"].intValue
        timestamps = parseTimestamps(json: json["timestamps"])
        service = parseService(nameService: json["service"].stringValue)
        parseVideoLink(json: json)
        //
        if let posterLink = json["image"].string {
            poster = await API.shared._requestImage(link: posterLink)
        }
    }
    
    /// скачивание постера для VideoDetailVC начиная с самого маленького "xs" и если его нет заканчивая "original"
    func setPosterDetail(json: JSON) async {
        if let xsLink = json["poster"]["xs"].string {
            posterDetail = await API.shared._requestImage(link: xsLink)
            return
        }
        if let smLink = json["poster"]["sm"].string {
            posterDetail = await API.shared._requestImage(link: smLink)
            return
        }
        if let mdLink = json["poster"]["md"].string {
            posterDetail = await API.shared._requestImage(link: mdLink)
        }
        if let originalLink = json["poster"]["original"].string {
            posterDetail = await API.shared._requestImage(link: originalLink)
            return
        }
    }
    
    private func parseStatus(input: String) -> Video.Status {
        switch input {
        case "in_progress":
            return .inProgress
        case "failure", "failed":
            return .failure
        case "success", "finished":
            return .success
        case "blocked":
            return .blocked
        case "completed":
            return .completed
        default:
            return .notStarted
        }
    }
    
    private func parseVideoLink(json: JSON) {
        let service = parseService(nameService: json["service"].stringValue)
        if service == .webcaster {
            videoLink = json["stream_link"].stringValue
        }
        if service == .kinescope {
            videoLink = json["assets"][0]["download_link"].stringValue
        }
    }
    
    private func parseTimestamps(json: JSON) -> [[Int]] {
        var temp = [[Int]]()
        for i in json.arrayValue {
            var temp_ = [Int]()
            i.arrayValue.forEach { json in
                temp_.append(json.intValue)
            }
            temp.append(temp_)
        }
        return temp
    }
    
    private func parseService(nameService: String) -> Video.ServiceVideo {
        return nameService == "webcaster" ? .webcaster : .kinescope
    }
}
