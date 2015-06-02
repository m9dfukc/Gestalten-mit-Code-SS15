/** A sine wave. Time is in seconds, frequency in hertz */ 
float sineWave(float time, float frequency) {
  return sin(time * TWO_PI * frequency); 
}

/** A sine wave. Time is in seconds, frequency in hertz, phase shift in 0 - TWO_PI */ 
float sineWave(float time, float frequency, float phase) {
  return sin(time * TWO_PI * frequency + phase); 
}


/** A triangle wave. Time is in seconds, frequency in hertz */ 
float triangleWave(float time, float frequency) {
  float period = (1.0 / frequency);
  float t = time - period * 0.25;
  return abs((t % period) - 0.5 * period) * frequency * 4.0 - 1.0;
}

/** A triangle wave. Time is in seconds, frequency in hertz, phase shift in 0 - TWO_PI */ 
float triangleWave(float time, float frequency, float phase) {
  float shift = (phase / TWO_PI) * (1.0 / frequency);
  return triangleWave(time + shift, frequency);
}


/** A sawtooth wave. Time is in seconds, frequency in hertz */ 
float sawtoothWave(float time, float frequency) {
  float t = time - (1.0 / frequency) * 0.25;
  float p = t * frequency;
  return (p % 1.0) * 2.0 - 1.0;
}

/** A sawtooth wave. Time is in seconds, frequency in hertz, phase shift in 0 - TWO_PI */ 
float sawtoothWave(float time, float frequency, float phase) {
  float shift = (phase / TWO_PI) * (1.0 / frequency);
  return sawtoothWave(time + shift, frequency);
}


/** A square wave. Time is in seconds, frequency in hertz */ 
float squareWave(float time, float frequency) {  
  return signum(sin(time * TWO_PI * frequency));
}

/** A square wave. Time is in seconds, frequency in hertz */ 
float squareWave(float time, float frequency, float phase) {
  float shift = (phase / TWO_PI) * (1.0 / frequency);
  return squareWave(time + shift, frequency);
}


/** The sign of a value. Returns -1 for negative values, 0 for 0 and 1 for positive values */
float signum(float value) {
  if (value == 0.0) return 0;
  else if (value > 0.0) return 1;
  else return -1;
}
