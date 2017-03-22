//
//  ViewController.swift
//  OutaTime
//
//  Created by Timothy Hang on 3/21/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import UIKit

protocol DatePickerViewControllerDelegate
{
  func dateWasChosen(date: Date)
}

class ViewController: UIViewController, DatePickerViewControllerDelegate
{
  @IBOutlet weak var destinationTimeLabel: UILabel!
  @IBOutlet weak var presentTimeLabel: UILabel!
  @IBOutlet weak var lastTimeDepartedLabel: UILabel!
  @IBOutlet weak var speedLabel: UILabel!

//  var DateFormatter: String?
  var currentSpeed = 0
  var speed: Timer?

  override func viewDidLoad()
  {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    title = "Time Circuits"
    destinationTimeLabel.text = "Jan 01, 2000"
    presentTimeLabel.text = "Mar 21, 2017"
    lastTimeDepartedLabel.text = "___ __ ____"
    view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 100)

  }

  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  @IBAction func setDestinationTimeTapped(sender: UIButton)
  {
    if speed == nil
    {
      speed = Timer(timeInterval: 0.1, repeats: true, block: { speed in
        if self.currentSpeed < 88
        {
          self.currentSpeed += 1
          self.speedLabel.text = "\(Int(self.currentSpeed)) MPH"
        }
        else
        {
          self.speed?.invalidate()
          self.speed = nil
          self.currentSpeed = 0
          self.speedLabel.text = "\(Int(self.currentSpeed)) MPH"
        }
      })
      RunLoop.current.add(speed!, forMode: RunLoopMode.commonModes)

    }
  }

//David was teaching me about delegation here
  func dateWasChosen(date: Date)
  {
    print(date)
    
//    let formatter = DateFormatter()
//    formatter.dateFormat = "MMM dd, YYYY"
    
  }
}

