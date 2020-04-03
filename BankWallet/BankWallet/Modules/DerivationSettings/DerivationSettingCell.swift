import UIKit
import SnapKit
import ThemeKit

class DerivationSettingCell: ThemeCell {
    private let leftView = DoubleLineCellView()
    private let rightView = CheckmarkCellView()

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(leftView)
        leftView.snp.makeConstraints { maker in
            maker.leading.top.bottom.equalToSuperview()
        }

        contentView.addSubview(rightView)
        rightView.snp.makeConstraints { maker in
            maker.trailing.top.bottom.equalToSuperview()
            maker.leading.equalTo(leftView.snp.trailing)
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bind(title: String, subtitle: String, selected: Bool, enabled: Bool, last: Bool = false) {
        super.bind(last: last, active: enabled)

        leftView.bind(title: title, subtitle: subtitle, active: enabled)
        rightView.bind(visible: selected)
    }

}
