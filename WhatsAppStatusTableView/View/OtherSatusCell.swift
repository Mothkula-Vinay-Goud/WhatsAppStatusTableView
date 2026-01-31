//
//  OtherSatusCell.swift
//  WhatsAppStatusTableView
//
//  Created by Vinay Goud Mothkula on 1/31/26.
//

import UIKit

class OtherSatusCell: UITableViewCell {

    @IBOutlet weak var statusNameLabel: UILabel!
    @IBOutlet weak var statusTimeLabel: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        statusImage.layer.cornerRadius = statusImage.frame.size.width / 2
        statusImage.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func sendData(sendData: StatusData?) {
        guard let sendData = sendData else { return }

        statusNameLabel.text = sendData.statusName
        statusImage.image = UIImage(named: sendData.statusImage ?? "")

        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.year, .month, .day], from: now)

        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        formatter.locale = Locale(identifier: "en_US_POSIX")

        if let timeDate = formatter.date(from: sendData.statusTime ?? ""),
           let today = calendar.date(from: components) {

            // Extract hours and minutes from timeDate
            let timeComponents = calendar.dateComponents([.hour, .minute], from: timeDate)

            // Combine today's date with the hours/minutes from statusTime
            var finalComponents = calendar.dateComponents([.year, .month, .day], from: today)
            finalComponents.hour = timeComponents.hour
            finalComponents.minute = timeComponents.minute

            if let statusDate = calendar.date(from: finalComponents) {
                let diffSeconds = Int(now.timeIntervalSince(statusDate))

                // Set the label based on difference
                if diffSeconds < 60 {
                    statusTimeLabel.text = "Just now"
                } else if diffSeconds < 3600 {
                    let minutes = diffSeconds / 60
                    statusTimeLabel.text = "\(minutes)mm ago"
                } else if diffSeconds < 86400 {
                    let hours = diffSeconds / 3600
                    statusTimeLabel.text = "\(hours)hr ago"
                } else if diffSeconds < 172800 {
                    statusTimeLabel.text = "Yesterday"
                } else {
                    let days = diffSeconds / 86400
                    statusTimeLabel.text = "\(days) days ago"
                }
            }
        } else {
            // fallback if parsing fails
            statusTimeLabel.text = sendData.statusTime
        }
    }



}
