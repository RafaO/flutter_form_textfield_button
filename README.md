# Flutter form sample

Flutter showcase of a form with a button

The aim of this project is to showcase how a form can load its initial content from an async call
and enable a "save" button only after this initial data has been modified.

## More details

This is a minimalistic example. Therefore only a `StatefulWidget` is in place. For real world examples
a proper architecture approach might be worth implementing (bloc, provider, etc...)

Within the state of this widget, there is a nullable variable that will represent the initial data
coming from our async call (in our case a simple `FutureBuilder`). Once this gets initialized, it will
serve as baseline to compare the current value of the text field. We do this by adding a listener to
the text controller.
