import UIKit

class WeatherViewController: UIViewController {
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var currentIcon: UIImageView!
  @IBOutlet weak var currentSummaryLabel: UILabel!
  @IBOutlet weak var forecastSummary: UILabel!
  @IBOutlet weak var presureLabel: UILabel!
  @IBOutlet weak var windSpeedLabel: UILabel!
  
  private let viewModel = WeatherViewModel()
  
  override func viewDidLoad() {
    viewModel.locationName.bind { [weak self] locationName in
      self?.cityLabel.text = locationName
    }
    
    viewModel.date.bind { [weak self] date in
      self?.dateLabel.text = date
    }
    
    viewModel.icon.bind { [weak self] image in
      self?.currentIcon.image = image
    }
    
    viewModel.summary.bind { [weak self] summary in
      self?.currentSummaryLabel.text = summary
    }
    
    viewModel.forecastSummary.bind { [weak self] forecast in
      self?.forecastSummary.text = forecast
    }
    
    viewModel.presureLevel.bind { [weak self] presure in
      self?.presureLabel.text = presure
    }
    
    viewModel.windSpeedIn.bind { [weak self] windSPD in
      self?.windSpeedLabel.text = windSPD
    }
    
  }
  
  @IBAction func promptForLocation(_ sender: Any) {
    //1
    let alert = UIAlertController(
      title: "Choose location",
      message: "Exmpl: 'London' or 'London England'",
      preferredStyle: .alert)
    alert.addTextField()
    //2
    let submitAction = UIAlertAction(
      title: "Submit",
      style: .default) { [unowned alert, weak self] _ in
        guard let newLocation = alert.textFields?.first?.text else { return }
        self?.viewModel.changeLocation(to: newLocation)
    }
    alert.addAction(submitAction)
    //3
    present(alert, animated: true)
  }
}
