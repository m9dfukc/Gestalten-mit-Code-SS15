
float sineWave(float time, float herz) {
  return sineWave(time, herz, 0.0);
}


// parameter time in seconds, herz = Oscillation per second, where do we start
float sineWave(float time, float herz, float off) {
  float phase = (time * herz) * TWO_PI;
  float offset = off * TWO_PI;
  return sin(phase + offset);
}
