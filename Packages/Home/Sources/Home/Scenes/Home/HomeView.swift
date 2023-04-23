import UIKit

protocol HomeView: UIView {
    func show(weather: HomePresentationModel)
    func show(weatherIcon: UIImage)
}

final class HomeViewImplementation: UIView {
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8.0
        stack.alignment = .center
        return stack
    }()
        
    private let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8.0
        stack.alignment = .leading
        return stack
    }()
    
    private let weatherStateImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.isHidden = true
        return image
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 64)
        return label
    }()
    
    private let weatherDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private let temperatureRangeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    }()

    private let loadingIndicator = UIActivityIndicatorView(style: .large)
    
    init() {
        super.init(frame: .zero)
        setupSubviews()
        setupConstraints()
        setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HomeViewImplementation {
    func setupSubviews() {
        addSubview(verticalStack)
        addSubview(loadingIndicator)

        verticalStack.addArrangedSubview(horizontalStack)
        verticalStack.addArrangedSubview(weatherDescriptionLabel)
        verticalStack.addArrangedSubview(temperatureRangeLabel)
        verticalStack.addArrangedSubview(UIView())
        
        horizontalStack.addArrangedSubview(weatherStateImage)
        horizontalStack.addArrangedSubview(temperatureLabel)
    }
    
    func setupConstraints() {
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStack.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            verticalStack.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 16),
            verticalStack.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
        ])
        
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        weatherStateImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherStateImage.widthAnchor.constraint(equalToConstant: 32),
            weatherStateImage.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalStack.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    func setupProperties() {
        loadingIndicator.startAnimating()
        backgroundColor = .systemBackground
        verticalStack.setCustomSpacing(16, after: horizontalStack)
    }
}

extension HomeViewImplementation: HomeView {
    func show(weather: HomePresentationModel) {
        loadingIndicator.stopAnimating()
        temperatureLabel.text = weather.currentTemperature
        weatherDescriptionLabel.text = weather.weatherDescription
        temperatureRangeLabel.text = weather.temperatureRange
    }
    
    func show(weatherIcon: UIImage) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
            self.weatherStateImage.image = weatherIcon
            self.weatherStateImage.isHidden = false
        }
    }
}
