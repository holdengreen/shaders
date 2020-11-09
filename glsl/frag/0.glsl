#ifdef GL_ES
    precision highp float;
#endif

varying vec2 tPos;
uniform float seed;
uniform float inverted_seed;

uniform vec2 viewport;

float mabs(float a)
{
    return a * (float(a>0.0) - float(a<0.0));
}

void main(void) {
    float x = gl_FragCoord.x / viewport.x;
    float y = gl_FragCoord.y / viewport.y;
    float max = 0.4;
    float c = pow(x, 2.0) + pow(y, 2.0);
    //c = c * 1.5;
    float m = mod(c, max) * 2.0 / max;
    //float diff = pow(seed+0.5, 2.0) - aplusb;
    vec4 begincolor = vec4(0.8, 0.2, 0.1, 1.0);
    vec4 endcolor = vec4(0.8, 0.6, 0.8, 1.0);

    float transtate = c / 2.0;
    vec4 color = ( (endcolor * transtate) + (begincolor * (1.0-transtate)) ) / 2.0;
    gl_FragColor = vec4(m*color.r, m*color.g, m*color.b, 1.0);
    //vec4(tPos * seed, 0.0, 1.0);
}
