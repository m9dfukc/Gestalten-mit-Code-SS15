class SineOsc {

  float start, freq, phase, comp, time, value, offset;

  SineOsc(float _freq) {
    this(_freq, 0.0);
  }

  SineOsc(float _freq, float _phase) {
    freq = _freq;
    phase = _phase;
    offset = 0.0;
    start = millis();
    time = (millis() - start) / 1000.0;
    comp = time * TWO_PI * freq + phase;
  }

  void restart() {
    start = millis();
  }

  void setFreq(float _freq) {
    float a = time%(1/freq) * TWO_PI * freq + offset;
    float b = time%(1/_freq) * TWO_PI * _freq + offset;
    offset += a - b;
    offset = offset%TWO_PI;
    freq = _freq;
  }

  void setPhase(float _phase) {
    phase = _phase;
  }

  float getOutput() {
    time = (millis() - start) / 1000.0;
    comp = time * TWO_PI * freq + phase + offset;
    return sin(comp);
  }

}