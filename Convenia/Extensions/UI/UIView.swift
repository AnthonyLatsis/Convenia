//
//  UIView.swift
//  Laser Nya
//
//  Created by Anthony Latsis on 18.11.16.
//  Copyright © 2016 Anthony Latsis. All rights reserved.
//

import UIKit

extension UIView {

    func insert(subviews: [UIView], at index: Int? = nil) {

        for object in subviews {
            object.translatesAutoresizingMaskIntoConstraints = false
            guard let someIndex = index else {
                self.addSubview(object)
                continue
            }
            self.insertSubview(object, at: someIndex)
        }
    }
}

extension UIView {

    private class func animationOption(for curve: UIViewAnimationCurve) -> UIViewAnimationOptions {

        switch curve {
        case .easeIn: return UIViewAnimationOptions.curveEaseIn
        case .easeInOut: return UIViewAnimationOptions.curveEaseInOut
        case .linear: return UIViewAnimationOptions.curveLinear
        case .easeOut: return UIViewAnimationOptions.curveEaseOut
        }
    }

    class func animate(duration: TimeInterval, delay: TimeInterval = 0, curve: UIViewAnimationCurve = .linear, animations: @escaping () -> (), completion: @escaping ((Bool) -> ())) {

        UIView.animate(withDuration: duration, delay: delay, options: animationOption(for: curve), animations: animations, completion: completion)
    }

    class func animate(duration: TimeInterval, delay: TimeInterval = 0, curve: UIViewAnimationCurve = .linear, animations: @escaping () -> ()) {

        UIView.animate(withDuration: duration, delay: delay, options: animationOption(for: curve), animations: animations, completion: nil)
    }
}

extension UIView {

    class func animate(duration: TimeInterval, update: @escaping (_ elapsed: TimeInterval) -> ()) {

        let custom = CustomTimingAnimation()

        custom.animate(duration: duration, update: update)
    }
}

extension UIView {

    class func animate(mass: CGFloat, stiffness: CGFloat, damping: CGFloat, update: @escaping (_ progress: CGFloat) -> ()) {

        let custom = CustomSpringAnimation()

        custom.animate(spring: SpringCurve.init(mass: mass, damping: damping, stiffness: stiffness), update: update)
    }

    class func animate(duration: TimeInterval, dampingRatio: CGFloat, update: @escaping (_ progress: CGFloat) -> ()) {

        let custom = CustomSpringAnimation()

        custom.animate(spring: SpringCurve.init(dampingRatio: dampingRatio, settlingDuration: duration), update: update)
    }
}

fileprivate protocol CustomAnimation {

    var startDate: Date { get set }

    var duration: TimeInterval { get set }

    func foo(sender: CADisplayLink)
}

private class CustomTimingAnimation: CustomAnimation {

    var startDate = Date()

    var duration = TimeInterval()

    var update: ((_ elapsed: TimeInterval) -> ())?

    func animate(duration: TimeInterval, update: @escaping (_ elapsed: TimeInterval) -> ()) {

        self.startDate = Date()

        let link = CADisplayLink.init(target: self, selector: #selector(foo))

        link.add(to: RunLoop.current, forMode: .defaultRunLoopMode)

        self.update = update
    }

    @objc func foo(sender: CADisplayLink) {

        let date = Date()

        let elapsed = date.timeIntervalSince(self.startDate)

        if (elapsed / self.duration) > 1 {

            sender.invalidate()
        }
        self.update?(elapsed)
    }
}

private class CustomSpringAnimation {

    var startDate = Date()

    var duration = TimeInterval()

    var update: (() -> ())?

    func animate(spring: SpringCurve, update: @escaping (_ progress: CGFloat) -> ()) {

        let link = CADisplayLink.init(target: self, selector: #selector(foo))

        self.duration = spring.settlingDuration()

        self.update = {

            let date = Date()

            let elapsed = CGFloat(date.timeIntervalSince(self.startDate))

            if (Double(elapsed) / self.duration) > 1 {

                link.invalidate()
            }
            update(1 - spring.value(at: elapsed))
        }
        self.startDate = Date()

        link.add(to: RunLoop.current, forMode: .defaultRunLoopMode)
    }

    @objc func foo(sender: CADisplayLink) {

        self.update?()
    }
}

private class SpringCurve {

    static let settlingValue: CGFloat = 0.0007

    let dampingRatio: CGFloat

    let w0: CGFloat
    let w1: CGFloat
    let c2: CGFloat

    let expc: CGFloat

    init(mass: CGFloat, damping: CGFloat, stiffness: CGFloat, initialVelocity: CGFloat = 0.0) {

        self.dampingRatio = damping / (2 * sqrt(mass * stiffness))

        self.w0 = sqrt(stiffness / mass)

        let helper = sqrt(1 - pow(dampingRatio, 2))

        self.w1 = w0 * helper

        self.c2 = dampingRatio / helper

        self.expc = -dampingRatio * w0
    }

    convenience init(dampingRatio: CGFloat, settlingDuration: TimeInterval) {

        let helper = sqrt(1 - pow(dampingRatio, 2))

        let c2 = dampingRatio / helper

        let w0 = 2 * (atan(1 / c2) + .pi) / ((0.0007 - CGFloat(settlingDuration)) * helper)

        let stiffness = pow(w0, 2)

        let mass: CGFloat = 1

        let damping = dampingRatio * 2 * sqrt(mass * stiffness)

        self.init(mass: mass, damping: damping, stiffness: stiffness)
    }

    func value(at time: CGFloat) -> CGFloat {

        if dampingRatio == 1 {

            return exp(expc * time)
        } else {
            return exp(expc * time) * (cos(w1 * time) + c2 * sin(w1 * time))
        }
    }

    func settlingDuration() -> TimeInterval {

        if dampingRatio == 1 {

            return TimeInterval(log(0.0007) / expc)
        } else {

            for i in 0... {

                if abs(value(at: self.extremumX(n: i))) < 0.0007 {

                    return TimeInterval(self.rootX(n: i - 1))
                }
            }
        }
        return TimeInterval.infinity
    }

    private func rootX(n: Int) -> CGFloat {

        return (.pi * CGFloat(n) - atan(1 / c2)) / w1
    }

    private func extremumX(n: Int) -> CGFloat {

        return (CGFloat(n) * .pi) / w1
    }
}


