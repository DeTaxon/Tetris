
#version 450 core

layout(location = 0) in vec2 in_pos;
layout(location = 1) in vec4 in_color;

out vec4 FragColor;
out vec2 outUV;

void main()
{
	outUV = in_color.xy;
	FragColor = vec4(1.0,1.0,1.0,1.0);
	gl_Position = vec4(in_pos,1.0,1.0);
}
