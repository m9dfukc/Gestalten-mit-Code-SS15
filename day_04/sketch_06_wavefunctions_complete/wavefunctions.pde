float sineWave(float time, float herz) {
  float phase = (time * herz) * TWO_PI;
  return sin(phase);
}
float squareWave(float time, float herz) {
  float timeInHerz = time * herz;
  float phase = timeInHerz%1;
  return ((phase <= 0.5) ? 1 : -1);
}
float sawWave(float time, float herz) {
   float timeInHerz = time * herz;
   float phase = timeInHerz%1;
   return map(phase, 0, 1, -1, 1);
}

float triangleWave(float time, float herz) {
  float period = (1.0 / herz);
  float t = time - period * 0.25;
  return abs((t % period) - 0.5 * period) * herz * 4.0 - 1.0;
}

