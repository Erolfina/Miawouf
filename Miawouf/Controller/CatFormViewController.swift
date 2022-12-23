//
//  CatFormViewController.swift
//  Miawouf
//
//  Created by Flore Gridaine on 2022-12-22.
//

import UIKit

class CatFormViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var majoritySwitch: UISwitch!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var racePickerView: UIPickerView!
    
  
    @IBAction func dismiss(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }
    
    @IBAction func validate(_ sender: Any) {
        createCatObject()
    }
    
    private func createCatObject() {
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
        let race = catRaces[raceIndex]
        let cat = Pet(name: name, hasMajority: hasMajority, race: race, gender: gender)
    }
    
}

extension CatFormViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return catRaces.count
    }
}

extension CatFormViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return catRaces[row]
    }
}

extension CatFormViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
