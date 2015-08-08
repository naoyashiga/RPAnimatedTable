# RPAnimatedTable :sunglasses:  
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

## Animation Start  :tada:
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

# Hierarchical timing
RPAnimationTable supports the information hierarchy. You can easily understand which cell the most important.  

Check it out :microphone:  
Meaningful transitions - Animation - Google design guidelines
http://www.google.com/design/spec/animation/meaningful-transitions.html#meaningful-transitions-hierarchical-timing

# TO DO  
implement for collectionView. :scream_cat:
