
#version 450 core

layout(location = 0) in vec2 in_pos;
layout(location = 1) in vec4 in_color;

out vec2 outUV;

void main()
{
	outUV = in_color.xy;
	gl_Position = vec4(in_pos,1.0,1.0);
}
