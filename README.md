# Flutter playground

Flutter showcase of whatever aspect I find interesting to play with. Some things you might find in
this repo are:
- State management / architectural PoC
- Widgets examples
- New APIs I want to try out

The app consists of an initial list view from where you can navigate to the different areas. As these
are things I am not an expert on, but rather things I am learning or want to try out the code sometimes
won't be a best practices example. Any contribution is appreciated and welcomed of course :)

## Basic form with async initial load

This is a minimalistic example. Therefore only a `StatefulWidget` is in place. For real world examples
a proper architecture approach might be worth implementing (bloc, provider, etc...)

Within the state of this widget, there is a nullable variable that will represent the initial data
coming from our async call (in our case a simple `FutureBuilder`). Once this gets initialized, it will
serve as baseline to compare the current value of the text field. We do this by adding a listener to
the text controller.

## Same as above but using `Provider`

Because of the link between the `TextController` and the initial data, I didn't find any better way
but to provide a callback to the method of the `Provider` performing the async load of the info.
