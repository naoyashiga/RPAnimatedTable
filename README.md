# RPAnimatedTable  
![](https://raw.githubusercontent.com/naoyashiga/RPAnimatedTable/master/demo.gif)  
Roppongi Animated Table :ghost:  

# Usage  

## initialize  
```swift
let vc = RPAnimatedTableViewController()
vc.animatedType = .Spring
```  
You need to set animatedType.  

## RPAnimatedTableViewController
```swift
class RPAnimatedTableViewController: UITableViewController {
}
```  
You need to inherit RPAnimatedTableViewController.

## Animation Start  
```swift
class RPAnimatedTableViewController: UITableViewController {
    var animation = RPTableAnimation()
    
    override func viewWillAppear(animated: Bool) {
        animation.animateTable(animatedTableViewController: self, animatedType: animatedType)
    }
}
```  

# Document  
## Animation Type  
```swift
enum RPAnimatedTableType {
    case Spring
    case FadeIn
}
```

# TO DO  
implement for collectionView.
