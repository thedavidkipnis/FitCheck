//
//  FilterOptionCell.swift
//  FitCheck V.0.1
//
//  Created by David Kipnis on 8/9/21.
//  Copyright © 2021 David Kipnis. All rights reserved.
//

import UIKit

class FilterOptionCell: UITableViewCell {
    var filterOption: FilterOption? {
        didSet {
            filterOptionLabel.text = filterOption?.name
            filterOptionValueLabel.text = filterOption?.val
        }
    }
    
    let filterOptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let filterOptionValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(filterOptionLabel)
        addSubview(filterOptionValueLabel)
    }
    
    func setupConstraints() {
        setupFilterOptionLabel()
        setupFilterOptionValueLabel()
    }
    
    func setupFilterOptionLabel() {
        filterOptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        filterOptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setupFilterOptionValueLabel() {
        filterOptionValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        filterOptionValueLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
