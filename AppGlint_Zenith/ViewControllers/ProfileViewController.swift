import UIKit

class ProfileViewController: UITableViewController {
    
    // Outlets for profile section
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        refreshData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshData()
    }
    
    private func setupUI() {
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.clipsToBounds = true
    }
    
    private func refreshData() {
        // Retrieve stored user data
        if let userData = UserDataManager.shared.getUserData() {
            nameLabel.text = userData.childName.isEmpty ? "Guest" : userData.childName
            emailLabel.text = userData.parentEmail.isEmpty ? "Not Provided" : userData.parentEmail
            
        } else {
            nameLabel.text = "Guest"
            emailLabel.text = "Not Provided"
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProfileEdit" {
            if let editProfileVC = segue.destination as? EditProfileViewController {
                if let userData = UserDataManager.shared.getUserData() {
                    editProfileVC.currentUserData = userData
                }
            }
        }
    }
}
