
class Brain {
  int[][] stuff;
  color c;
  float[] mean;

  Brain() // initialized the means to 0.
  {
    mean = new float[11];
    for(int i = 0;i<11;i++) mean[i] = 0.0;
  }

  void readfile(String filename)
  {
    int[][] therealstuff;
    String[] thestuff;
    thestuff = loadStrings(filename); // which file
    stuff = new int[thestuff.length][11];
    for (int i = 0; i<thestuff.length; i++)
    {
      String[] foo = thestuff[i].split(",");
      for (int j = 0; j<11; j++)
      {
        // turn everything into a two-dimensional array of integers
        stuff[i][j] = parseInt(foo[j]);
        if (stuff[i][j]>stuffmax[j]) stuffmax[j]=stuff[i][j];
        if (stuff[i][j]<stuffmin[j]) stuffmin[j]=stuff[i][j];
      }
    }
  }

  void domean()
  {

    for (int i = 0; i<stuff.length; i++)
    {
      for (int j = 0; j<11; j++) {
        mean[j]+=stuff[i][j];
      }
    }
    for (int i = 0; i<11; i++)
    {
      mean[i] = mean[i]/stuff.length;
      printArray(mean);
    }
  }
}

