import UIKit
//MARK: - UITextFieldDelegate
extension SingUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        if textField == contentView.getNameTextField() {
            viewModel.updateName(updatedText)
        } else if textField == contentView.getEmaiTextField() {
            viewModel.updateEmail(updatedText)
        } else if textField == contentView.getPhoneTextField() {
            viewModel.updatePhone(updatedText)
        }
        
        DispatchQueue.main.async {
            self.validateInputs()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
         if textField == contentView.getNameTextField() {
             validateNameTextField()
         } else if textField == contentView.getEmaiTextField() {
             validateEmailTextField()
         } else if textField == contentView.getPhoneTextField() {
             validatePhoneTextField()
         }
        validatePhotoTextField()

     }
    
    private func validateNameTextField() {
        let name = contentView.getNameTextField().text ?? ""
        if name.isEmpty {
            contentView.setNameInvalidText(placeholder: TextContainer.SingUpScreen.name,
                                           infoText: "Required field")
        } else if !ValidationService.isValidName(name) {
            contentView.setNameInvalidText(placeholder: TextContainer.SingUpScreen.name,
                                           infoText: "Invalid name format")
        } else {
            contentView.setDefaultNameTextField()
        }
    }
    
    private func validateEmailTextField() {
        let email = contentView.getEmaiTextField().text ?? ""
        if email.isEmpty {
            contentView.setEmailInvalidText(placeholder: TextContainer.SingUpScreen.email,
                                            infoText: "Required field")
        } else if !ValidationService.isValidEmail(email) {
            contentView.setEmailInvalidText(placeholder: TextContainer.SingUpScreen.email,
                                            infoText: "Invalid email format")
        } else {
            contentView.setDefaultEmailTextField()
        }
    }
    
    private func validatePhoneTextField() {
        let phone = contentView.getPhoneTextField().text ?? ""
        if phone.isEmpty {
            contentView.setPhoneInvalidText(placeholder: TextContainer.SingUpScreen.phone,
                                            infoText: "Required field")
        } else if !ValidationService.isValidPhone(phone) {
            contentView.setPhoneInvalidText(placeholder: TextContainer.SingUpScreen.phone,
                                            infoText: "Invalid phone format")
        } else {
            contentView.setDefaultPhoneTextField()
        }
    }
    
    private func validatePhotoTextField() {
        let photo = contentView.getPhotoTextField().text ?? ""
        if photo.isEmpty {
            contentView.setPhotoInvalidText(placeholder: "Upload your photo",
                                            infoText: "Photo is required")
        } else {
            contentView.setDefaultPhotoTextField()
        }
    }
}
