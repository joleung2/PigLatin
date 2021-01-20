public void setup() 
{
  String[] lines = loadStrings("words.txt");
  ArrayList <String[]> wordArrays = new ArrayList <String[]> ();
  for (int i = 0; i < lines.length; i++) {
    wordArrays.add(split(lines[i]));
  }
  System.out.println("there are " + lines.length + " lines");
  for (int i = 0; i < wordArrays.size(); i++) 
  {
    for (int j = 0; j < wordArrays.get(i).length; j++) {
      System.out.print(pigLatin(wordArrays.get(i)[j]));
      System.out.print(" ");
    }
    System.out.println("");
  }
}
public int findFirstVowel(String word) {
  for (int i = 0; i < word.length(); i++) {
    if (word.charAt(i) == 'a' || word.charAt(i) == 'e'|| word.charAt(i) == 'i' || word.charAt(i) == 'o' || word.charAt(i) == 'u'|| word.charAt(i) == 'A'|| word.charAt(i) == 'E'|| word.charAt(i) == 'I'|| word.charAt(i) == 'O'|| word.charAt(i) == 'U') return i;
  }
  return -1;
}

public String[] split(String sentence) {
  ArrayList <String> words = new ArrayList <String> ();
  String tempWord = "";
  for (int i = 0; i < sentence.length(); i++){
    if (sentence.charAt(i) == ' ' || sentence.charAt(i) == ',' || sentence.charAt(i) == '.'){
       words.add(tempWord);
       tempWord = "";
    }
    else {
      tempWord += sentence.substring(i,i+1);
    }
  }
  String[] result = new String[words.size()]; 
  for (int j = 0; j < words.size(); j++) 
    result[j] = words.get(j); 
  return result;
}

public String pigLatin(String sWord)
  //precondition: sWord is a valid String of length greater than 0
  //postcondition: returns the pig latin equivalent of sWord
{
  if (findFirstVowel(sWord) == -1)
  {
    return sWord + "ay";
  } else if (findFirstVowel(sWord) <= 3) {
    return  sWord.substring(findFirstVowel(sWord)) + sWord.substring(0, findFirstVowel(sWord)) + "ay";
  } else if (findFirstVowel(sWord) == 1)
  {
    return sWord + "way";
  } else if (sWord.substring(0, 2) == "qu")
  {
    return sWord.substring(2) + "quay";
  } else
  {
    return "ERROR!";
  }
}
