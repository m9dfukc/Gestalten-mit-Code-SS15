class Wavefunction {

  public final static int SINE = 0;
  public final static int TRIANGLE = 1;
  public final static int SAW = 2;
  public final static int SQUARE = 3;

  int waveform;

  float phase;
  float freq;

  Wavefunction(int waveform) {
    this(waveform, 1.0);
  }

  Wavefunction(int waveform, float freq) {
    this(waveform, freq, 0.0);
  }

  Wavefunction(int waveform, float freq, float phase) {
    this.set(waveform, freq, phase);
  }
  
  void waveform(int waveform) {
    if (waveform == Wavefunction.SINE ||  
        waveform == Wavefunction.TRIANGLE ||
        waveform == Wavefunction.SAW ||
        waveform == Wavefunction.SQUARE) 
    {
      this.waveform = waveform;
    } 
    else 
    {
      this.waveform = Wavefunction.SINE;
    }
  }

  void freq(float freq) {
    this.freq = freq;
  }

  void phase(float phase) {
    this.phase = phase;
  }
  
  void set(int waveform, float freq, float phase) {
    this.waveform(waveform);
    this.freq(freq);
    this.phase(phase);
  }

  float process(float time) {
    
    switch(this.waveform) {
      case Wavefunction.SINE:
        return sineWave(time, this.freq, this.phase);
        
      case Wavefunction.TRIANGLE:
        return triangleWave(time, this.freq, this.phase);
        
      case Wavefunction.SAW:
        return sawtoothWave(time, this.freq, this.phase);
        
      case Wavefunction.SQUARE:
        return squareWave(time, this.freq, this.phase); 
    }
    
    return 0.0;
  }


  float sineWave(float time, float frequency, float phase) {
    return sin(time * TWO_PI * frequency + phase);
  }

  float triangleWave(float time, float frequency, float phase) {
    float shift = (phase / TWO_PI) * (1.0 / frequency);
    float period = (1.0 / frequency);
    float t = (time + shift) - period * 0.25;
    return abs((t % period) - 0.5 * period) * frequency * 4.0 - 1.0;
  }

  float sawtoothWave(float time, float frequency, float phase) {
    float shift = (phase / TWO_PI) * (1.0 / frequency);
    float t = (time + shift) - (1.0 / frequency) * 0.25;
    float p = t * frequency;
    return (p % 1.0) * 2.0 - 1.0;
  }

  float squareWave(float time, float frequency, float phase) {
    return signum(sineWave(time, frequency, phase));
  }

  float signum(float value) {
    if (value == 0.0) return 0;
    else if (value > 0.0) return 1;
    else return -1;
  }
}

