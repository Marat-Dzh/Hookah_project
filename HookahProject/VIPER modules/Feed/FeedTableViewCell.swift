import UIKit

extension UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

class FeedTableViewCell: UITableViewCell {
    
    var title = UILabel()
    var newsImage = UIImageView()
    var descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(title)
        title.font = Font.system(ofSize: 25.0, weight: .medium)
        title.textColor = .white
        title.backgroundColor = .black
        title.topAnchor.constraint(equalTo: topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        addSubview(newsImage)
        imageView?.contentMode = .scaleAspectFit
        newsImage.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        newsImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        newsImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        newsImage.heightAnchor.constraint(equalToConstant: 400.0).isActive = true
        
    
        addSubview(descriptionLabel)
        descriptionLabel.font = Font.system(ofSize: 17, weight: .regular)
        descriptionLabel.textColor = .white
        descriptionLabel.backgroundColor = .black
        descriptionLabel.topAnchor.constraint(equalTo: newsImage.bottomAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
