//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Timothy Hang on 3/21/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//David was teaching me about delegation here

import UIKit

class DatePickerViewController: UIViewController
{
  @IBOutlet weak var datePicker: UIDatePicker!
  var delegate: DatePickerViewControllerDelegate! //signed up to recieve stuff
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    datePicker.date = Date()
  }
  
  override func viewDidDisappear(_ animated: Bool)
  {
    super.viewDidDisappear(animated)
    
    
    delegate.dateWasChosen(date: datePicker.date)
  }
  
}
