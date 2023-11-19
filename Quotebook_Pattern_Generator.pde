String[] header;// = loadStrings("header.txt");
String[] ender;// = loadStrings("ender.txt");
String[] preQuote;// = loadStrings("preQuote.txt");
String[] afterQuote;
String[] output = new String[10000];
int currentLine = 0;

int startIndex = 454;
int endIndex = 554;
  
void setup(){
  
  header = loadStrings("header.txt");
  ender = loadStrings("ender.txt");
  preQuote = loadStrings("preQuote.txt");
  afterQuote = loadStrings("afterQuote.txt");
  
  initializeOutput();
    
  for(int i = startIndex; i <= endIndex; i++)
    addQuote(i);
  
  finalizeOutput();
  
  String[] fineOutput = finalizeOutput();  
  saveStrings("Quote blanks from #" + startIndex + " to #" + endIndex + ".rtf", fineOutput);  
  println("File Generated:" + "'Quote blanks from #" + startIndex + " to #" + endIndex + ".rtf'");
}


void addQuote(int index){
  
  for(int i = 0; i < preQuote.length; i++){
    
    output[currentLine] = preQuote[i];  
    currentLine++;
  }
  
  currentLine--;
  output[currentLine] += index + ")\\";
  currentLine++;

  for(int i = 0; i < afterQuote.length; i++){
    
    output[currentLine] = afterQuote[i];  
    currentLine++;
  }
}


void initializeOutput(){
  
  for(int i = 0; i < output.length; i++)
    output[i] = new String();
    
  for (; currentLine < header.length; currentLine++)
    output[currentLine] = header[currentLine];  
}


String[] finalizeOutput(){
  
  for (int i = 0; i < ender.length; i++){
    
    output[currentLine] = ender[i];  
    currentLine++;
  }
  
  String[] fineOut = new String[currentLine];
  
  for(int i = 0; i < currentLine; i++)
    fineOut[i] = output[i];
    
  return fineOut;
}
