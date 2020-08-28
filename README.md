# RXSwiftTutorial

Rx is a generic abstraction of computation expressed through ``` Observable<Element> ``` interface.

### Observing Observables

```swift
  private let selectedOptionVariable = Variable("User")
    var selectedOption:Observable<String> {
        return selectedOptionVariable.asObservable() 
    }
    
```

### Action to update ``` selectedOptionVariable ```

```swift

 @objc func buttonDidTapped(sender:UIButton) {
        if let text = sender.titleLabel?.text {
            selectedOptionVariable.value = text
        }
    }

```

### Fill text with selected option

```swift

  let disposeBag = DisposeBag()
  
  let choiceLabelViewController = ChoiceLabelViewController()
       choiceLabelViewController.selectedOption
           .subscribe(onNext: { [ weak self ] option in
               self?.choiceLabel.text = option
          }).disposed(by: disposeBag)

```

