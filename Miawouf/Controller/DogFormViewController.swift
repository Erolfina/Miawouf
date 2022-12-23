//
//  FormViewController.swift
//  Miawouf
//
//  Created by Flore Gridaine on 2022-12-22.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var majoritySwitch: UISwitch!
    @IBOutlet weak var racePickerView: UIPickerView!
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }
    
    @IBAction func validate(_ sender: Any) {
        createDogObject()
        }
    
    private func createDogObject() {
        let name = nameTextField.text
        let phone = phoneTextField.text
        let hasMajority = majoritySwitch.isOn
        var gender: Pet.Gender = genderSegmentedControl.selectedSegmentIndex == 0 ? .female :.male  //formule ternaire de
       /* if genderSegmentedControl.selectedSegmentIndex == 0 {
            gender = .female
        } else {
            gender = .male
        }*/
        var raceIndex = racePickerView.selectedRow(inComponent: 0)
        let race = dogRaces[raceIndex]
        let dog = Pet(name: name, hasMajority: hasMajority, race: race, gender: gender)
        
    }
    
}

extension FormViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return dogRaces.count
    }
}

extension FormViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return dogRaces[row]
    }
}

extension FormViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true

    }
    
}

    
