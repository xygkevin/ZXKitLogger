//
//  HDLoggerSwiftTableViewCell.swift
//  HDWindowLoggerSwift
//
//  Created by Damon on 2019/6/24.
//  Copyright © 2019 Damon. All rights reserved.
//

import UIKit

class HDLoggerSwiftTableViewCell: UITableViewCell {
    
    private lazy var mContentLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.p_createUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func p_createUI() -> Void {
        self.backgroundColor = UIColor.clear
        self.contentView.addSubview(self.mContentLabel)
        self.mContentLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.bottom.equalToSuperview()
        }
    }
    
    func updateWithLoggerItem(loggerItem:HDWindowLoggerItem, highlightText:String) {
        switch loggerItem.mLogItemType {
        case .kHDLogTypeNormal:
            self.mContentLabel.textColor = UIColor(red: 80.0/255.0, green: 216.0/255.0, blue: 144.0/255.0, alpha: 1.0)
            break
        case .kHDLogTypeWarn:
            self.mContentLabel.textColor = UIColor(red: 246.0/255.0, green: 244.0/255.0, blue: 157.0/255.0, alpha: 1.0)
            break
        case .kHDLogTypeError:
            self.mContentLabel.textColor = UIColor(red: 255.0/255.0, green: 118.0/255.0, blue: 118.0/255.0, alpha: 1.0)
            break
        case .kHDLogTypePrivacy:
            self.mContentLabel.textColor = UIColor(red: 66.0/255.0, green: 230.0/255.0, blue: 164.0/255.0, alpha: 1.0)
            break
        }
        
        loggerItem.getHighlightAttributedString(highlightString: highlightText) { (hasHighlightStr, hightlightAttributedString) in
            self.mContentLabel.attributedText = hightlightAttributedString
            if hasHighlightStr {
                self.contentView.backgroundColor = UIColor(red: 145.0/255.0, green: 109.0/255.0, blue: 213.0/255.0, alpha: 1.0)
            } else {
                self.contentView.backgroundColor = UIColor.clear
            }
        }
    }
}
