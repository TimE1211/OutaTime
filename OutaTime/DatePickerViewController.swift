//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Timothy Hang on 3/21/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController
{
  @IBOutlet weak var datePicker: UIDatePicker!
  var delegate: DatePickerViewControllerDelegate?
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    datePicker.date = Date()
  }

  @IBAction func setTapped(sender: UIButton)
  {
    let dateChosen = datePicker.date
    delegate?.dateWasChosen(date: dateChosen)
    dismiss(animated: true, completion: nil)
  }
}
