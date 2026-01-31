//
//  statusData.swift
//  WhatsAppStatusTableView
//
//  Created by Vinay Goud Mothkula on 1/31/26.
//

import Foundation
import UIKit

struct StatusData{
    var statusImage: String?
    var statusName: String?
    var statusTime: String?
    
    static func getData() -> [StatusData]{
        var data : [StatusData] = []
        let obj1 = StatusData(statusImage:"eurovision.png", statusName:"Vinay", statusTime: "10:45 AM")
        let obj2 = StatusData(statusImage: "eurovision.png", statusName:"Srinath", statusTime:"1:40 PM")
        let obj3 = StatusData(statusImage: "eurovision.png", statusName: "Tarani", statusTime: "10:45 AM")
        data.append(obj1)
        data.append(obj2)
        data.append(obj3)
        
        return data
        
        
    }
    
}
