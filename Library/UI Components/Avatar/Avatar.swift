//  Avatar.swift
//  CometChatUIKit
//  Created by Pushpsen Airekar on 20/09/19.
//  Copyright ©  2019 CometChat Inc. All rights reserved.

/* >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 
 Avatar: This component will be the class of UIImageView which is customizable to display Avatar. 
 
 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  */


// MARK: - Importing Frameworks.

import Foundation
import  UIKit
import  CometChatPro


/*  ----------------------------------------------------------------------------------------- */

@IBDesignable
@objc public class Avatar: UIImageView {
    
    // MARK: - Declaration of IBInspectable
    
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var borderColor: UIColor = UIColor.lightGray
    @IBInspectable var borderWidth: CGFloat = 0.5
    
    // MARK: - Initialization of required Methods
    
    override init(image: UIImage?) { super.init(image: image) }  
    override init(frame: CGRect) { super.init(frame: frame) }
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.clipsToBounds = true
    }
    
    // MARK: - Public instance methods
    
    /**
     This method used to set the cornerRadius for Avatar class
     - Parameter cornerRadius: This specifies a float value  which sets corner radius.
     - Author: CometChat Team
     - Copyright:  ©  2019 CometChat Inc.
     - See Also:
     [Avatar Documentation](https://prodocs.cometchat.com/docs/ios-ui-components#section-1-avatar)
     */
    @objc public func set(cornerRadius : CGFloat) -> Avatar {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        return self
    }
    
    /**
     This method used to set the borderColor for Avatar class
     - Parameter borderColor: This specifies a `UIColor` for border of the Avatar.
     - Author: CometChat Team
     - Copyright:  ©  2019 CometChat Inc.
     - See Also:
     [Avatar Documentation](https://prodocs.cometchat.com/docs/ios-ui-components#section-1-avatar)
     */
    @objc public func set(borderColor : UIColor) -> Avatar {
        self.layer.borderColor = borderColor.cgColor
        return self
    }
    
    /**
     This method used to set the borderWidth for Avatar class
     - Parameter borderWidth: This specifies a `CGFloat` for border width of the Avatar.
     - Author: CometChat Team
     - Copyright:  ©  2019 CometChat Inc.
     - See Also:
     [Avatar Documentation](https://prodocs.cometchat.com/docs/ios-ui-components#section-1-avatar)
     */
    @objc public func set(borderWidth : CGFloat) -> Avatar {
        self.layer.borderWidth = borderWidth
        return self
    }
    
    
    /**
     This method used to set the image for Avatar class
     - Parameter image: This specifies a `URL` for  the Avatar.
     - Author: CometChat Team
     - Copyright:  ©  2019 CometChat Inc.
     - See Also:
     [Avatar Documentation](https://prodocs.cometchat.com/docs/ios-ui-components#section-1-avatar)
     */
    @objc public func set(image: String) {
        
        let url = URL(string: image)
        self.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "defaultAvtar.jpg"))
    }
}

/*  ----------------------------------------------------------------------------------------- */