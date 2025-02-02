
#version 450 core

in vec2 outUV;

layout (binding = 0) uniform sampler2D text;

out vec4 ResultColor;

void main()
{
	ResultColor = texture(text,outUV);
}
