#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform float fraction;

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;

void main() {
  float intensity;
  vec4 color;
  intensity = max(0.0, dot(vertLightDir, vertNormal));
  if (intensity > pow(0.99, fraction))
  color = vec4(vec3(0.98), 1.0);
  else if (intensity > pow(0.98, fraction))
  color = vec4(vec3(0.88), 1.0);
  else if (intensity > pow(0.96, fraction))
  color = vec4(vec3(0.86), 1.0);
  else if (intensity > pow(0.94, fraction))
  color = vec4(vec3(0.84), 1.0);
  else if (intensity > pow(0.92, fraction))
  color = vec4(vec3(0.82), 1.0);

  else if (intensity > pow(0.90, fraction))
  color = vec4(vec3(0.80), 1.0);
  else if (intensity > pow(0.88, fraction))
  color = vec4(vec3(0.78), 1.0);
  else if (intensity > pow(0.86, fraction))
  color = vec4(vec3(0.76), 1.0);
  else if (intensity > pow(0.84, fraction))
  color = vec4(vec3(0.74), 1.0);
  else if (intensity > pow(0.82, fraction))
  color = vec4(vec3(0.72), 1.0);

  else if (intensity > pow(0.80, fraction))
  color = vec4(vec3(0.70), 1.0);
  else if (intensity > pow(0.78, fraction))
  color = vec4(vec3(0.68), 1.0);
  else if (intensity > pow(0.76, fraction))
  color = vec4(vec3(0.66), 1.0);
  else if (intensity > pow(0.74, fraction))
  color = vec4(vec3(0.64), 1.0);
  else if (intensity > pow(0.72, fraction))
  color = vec4(vec3(0.62), 1.0);


  else if (intensity > pow(0.70, fraction))
  color = vec4(vec3(0.60), 1.0);
  else if (intensity > pow(0.68, fraction))
  color = vec4(vec3(0.58), 1.0);
  else if (intensity > pow(0.66, fraction))
  color = vec4(vec3(0.56), 1.0);
  else if (intensity > pow(0.64, fraction))
  color = vec4(vec3(0.54), 1.0);
  else if (intensity > pow(0.62, fraction))
  color = vec4(vec3(0.52), 1.0);

  else if (intensity > pow(0.60, fraction))
  color = vec4(vec3(0.50), 1.0);
  else if (intensity > pow(0.58, fraction))
  color = vec4(vec3(0.48), 1.0);
  else if (intensity > pow(0.56, fraction))
  color = vec4(vec3(0.46), 1.0);
  else if (intensity > pow(0.54, fraction))
  color = vec4(vec3(0.44), 1.0);
  else if (intensity > pow(0.52, fraction))
  color = vec4(vec3(0.42), 1.0);

  else if (intensity > pow(0.50, fraction))
  color = vec4(vec3(0.40), 1.0);
  else if (intensity > pow(0.48, fraction))
  color = vec4(vec3(0.38), 1.0);
  else if (intensity > pow(0.46, fraction))
  color = vec4(vec3(0.36), 1.0);
  else if (intensity > pow(0.44, fraction))
  color = vec4(vec3(0.34), 1.0);
  else if (intensity > pow(0.42, fraction))
  color = vec4(vec3(0.32), 1.0);

  else if (intensity > pow(0.40, fraction))
  color = vec4(vec3(0.30), 1.0);
  else if (intensity > pow(0.38, fraction))
  color = vec4(vec3(0.28), 1.0);
  else if (intensity > pow(0.36, fraction))
  color = vec4(vec3(0.26), 1.0);
  else if (intensity > pow(0.34, fraction))
  color = vec4(vec3(0.24), 1.0);
  else if (intensity > pow(0.32, fraction))
  color = vec4(vec3(0.22), 1.0);

  else
  color = vec4(vec3(0.10), 1.0);


  gl_FragColor = color * vertColor;
}
