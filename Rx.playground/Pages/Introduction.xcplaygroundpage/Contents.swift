//: [Index](Index)

import RxSwift
import Foundation

/*:
# Introduction

## Why use RxSwift?

A vast majority of the code we write revolves around responding to external actions. When a user manipulates a control, we need to write an @IBAction to respond to that. We need to observe Notifications to detect when the keyboard changes position. We must provide blocks to execute when URL Sessions respond with data. And we use KVO to detect changes in variables.
All of these various systems makes our code needlessly complex. Wouldn't it be better if there was one consistent system that handled all of our call/response code? Rx is such a system.

### Basis

The key to understanding RxSwift is in understanding the notion of Observables like **sequences** of elements.
Then to learn to **creating** them, **manipulating** them, and as finally **subscribing** to them and so to start the computation and the reception of its elements for work with they.
If the Observable emit `Event.Next` (an element of the sequence) can still send events, but if Observable emit `Event.Error` (the Observeble sequece terminate with an error) or `Event.Completed` (the Observeble sequece is completed without error), Observable's emission is interrupted forever.

Sequence grammar explains this more concisely.

`Next* (Error | Completed)?`


## Subscription to Observables sequences

Creating an Observable is one thing, but if nothing subscribes to the observable, then nothing will come. Scilicet only after almostt one subscription was made over the observable sequence, is will can begin to emit arbitrary number of `Next` events (sequence elements), but no more events will be produced after `Error` or `Completed` are emitted.

The closure of next Observable never will be called:
*/

_/* : Observable<String>*/ = Observable<String>.create { observerOfString -> Disposable in
        print("This never will be printed")
        observerOfString.on(.Next("😬"))
        observerOfString.on(.Completed)
        return NopDisposable.instance
    }

/*:

However in the next example is called:
*/

_/* : Observable<String>*/ = Observable<String>.create { observerOfString -> Disposable in
        print("Observable creation")
        observerOfString.on(.Next("😉"))
        observerOfString.on(.Completed)
        return NopDisposable.instance
    }
    .subscribe { print($0) }

/*:


Of it so the subscription will be present in whole Rx.playground.

*/

//: [Index](Index) - [Next >>](@next)
