import processing.sound.*;

SoundFile sample, sample2;
FFT fft, fft2;

int scale=1;
int bands=512;
float[] spectrum = new float[bands];
float[] spectrum2 = new float[bands];


public void setup() {
    size(512,512);
    background(255);
      

    sample = new SoundFile(this, "sound1.mp3");
    sample2 = new SoundFile(this, "sound2.mp3");
    sample.play(0.5);
    sample.loop();
    
    sample2.play(0.5);
    sample2.loop();
    
    // Create and patch the rms tracker
    fft = new FFT(this);
    fft.input(sample, bands);
    
        // Create and patch the rms tracker
    fft2 = new FFT(this);
    fft2.input(sample2, bands);
}      
  
public void draw() {
    background(255);
    
    fft.analyze(spectrum);
    fft2.analyze(spectrum2);

    for(int i = 0; i < bands; i++)
    {
      float posX = map(i, 0, bands, 0, width);
      line( posX, height, posX, height - spectrum[i]*height*2.5);
    }
    
    pushMatrix();
    translate(0, -height/2.0);
    for(int i = 0; i < bands; i++)
    {
      float posX = map(i, 0, bands, 0, width);
      line( posX, height, posX, height - spectrum2[i]*height*5);
    }
   popMatrix(); 
}
