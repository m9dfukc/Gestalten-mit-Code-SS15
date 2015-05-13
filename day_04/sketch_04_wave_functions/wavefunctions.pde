
float sineWave(float time, float herz) {
  return sineWave(time, herz, 0.0);
}


// parameter time in seconds, herz = Oscillation per second, where do we start
float sineWave(float time, float herz, float off) {
  float phase = (time * herz) * TWO_PI;
  float offset = off * TWO_PI;
  return sin(phase + offset);
}

float sawWave(float time, float herz) {
   float timeInHerz = time * herz;
   float phase = timeInHerz%1;
   return map(phase, 0, 1, -1, 1);
}

float squareWave(float time, float herz) {
  float timeInHerz = time * herz;
  float phase = timeInHerz%1;
  float value = 0;
  if (phase <= 0.5) {
    value = 1;
  } else {
    value = -1;
  }
  
  return value;
}
