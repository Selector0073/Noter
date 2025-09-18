import 'dart:html';

void main () {
  FormElement form = querySelector('#AddNote') as FormElement;
  DivElement BoxOutput = querySelector('#notes') as DivElement;


  String cookies = document.cookie!;
  List<String> cookiePairs = cookies.split("; ");
  List<String> noteValues = cookiePairs
    .where((pair) => pair.startsWith("note"))
    .map((pair) => pair.split("=")[1])
    .toList();



  for (var i = 0; i <= noteValues.length; i++) {
    HRElement hr = HRElement();
    DivElement newDiv = DivElement()
      ..id = 'note'
      ..id = 'note$i';
    ParagraphElement newElem = ParagraphElement()
      ..text = noteValues[i];
    ButtonElement newDelete = ButtonElement()
      ..classes.add('fx-strobe')
      ..text = 'DELETE'
      ..id = 'note$i';



    BoxOutput.append(newDiv);
    newDiv.append(newElem);
    newDiv.append(newDelete);
    BoxOutput.append(hr);
  }



  form.onSubmit.listen((event) {
    int cookieCount = noteValues.length;
    cookieCount++;
    TextAreaElement note = form.querySelector('#Textarea') as TextAreaElement;
    document.cookie = "note$cookieCount=${note.value}; path=/;";
  });
}