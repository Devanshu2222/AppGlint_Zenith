import UIKit

class EditProfileViewController: UITableViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    // Variable to hold the user data passed from ProfileViewController
    var currentUserData: UserData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        // Configure profile image view
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.clipsToBounds = true
        
        // Set initial values from the current user data
        if let userData = currentUserData {
            nameTextField.text = userData.childName
            phoneTextField.text = userData.phone  // Pre-fill the phone number
            emailTextField.text = userData.parentEmail
            profileImageView.image = UIImage(named: "defaultProfileImage") // Assuming you use a default profile image
        }
    }
    
    

        @IBAction func saveButtonTapped(_ sender: Any) {
        let newName = nameTextField.text ?? ""
        let newPhone = phoneTextField.text ?? ""  // Get the updated phone number
        let newEmail = emailTextField.text ?? ""
        
        // Update the user data
        let childName = newName.isEmpty ? "Guest" : newName
        UserDataManager.shared.saveUserData(childName: childName, childAge: 8, parentEmail: newEmail, phone: newPhone)
        
        // Navigate back to the previous screen
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editProfileTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()

        imagePicker.delegate = self
           let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
           let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
           alertController.addAction(cancelAction)
           if UIImagePickerController.isSourceTypeAvailable(.camera){
               let cameraAction = UIAlertAction(title: "Camera", style: .default,handler: {action in print("User Chose Camera")
                   imagePicker.sourceType = .camera
                   self.present(imagePicker, animated: true, completion: nil)
               })
               alertController.addAction(cameraAction)}
           if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
               let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {action in print("User Chose Photo Library")
                   imagePicker.sourceType = .photoLibrary
                   self.present(imagePicker, animated: true , completion: nil)})
               alertController.addAction(photoLibraryAction)}
               present(alertController, animated: true,completion: nil)
               print("Camera Button Tapped")

    }
}
