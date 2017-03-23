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

  let formatter = DateFormatter()
  let today = Date()
  var currentSpeed = 0
  var speed: Timer?

  override func viewDidLoad()
  {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    title = "Time Circuits"
    formatter.dateFormat = "MMM dd y"
    destinationTimeLabel.text = formatter.string(from: today).uppercased()
    presentTimeLabel.text = formatter.string(from: today).uppercased()
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

  func dateWasChosen(date: Date)
  {
    lastTimeDepartedLabel.text = presentTimeLabel.text
    destinationTimeLabel.text = formatter.string(from: date).uppercased()
    presentTimeLabel.text = destinationTimeLabel.text
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    let destinationVC = segue.destination as! DatePickerViewController
    destinationVC.delegate = self
  }
  
  @IBAction func travelBackTapped(sender: UIButton)
  {
    destinationTimeLabel.text = lastTimeDepartedLabel.text
    lastTimeDepartedLabel.text = presentTimeLabel.text
    presentTimeLabel.text = destinationTimeLabel.text
    
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

}

