#version 450 core

layout(location = 0) in float isSet;


struct GlobInfo
{
	vec2 offset;
	vec2 boxSize;
	vec2 boxMargin;
	ivec2 counts;
};

//layout(location = 0) uniform GlobInfo Consts;

out vec4 FragColor;

int offsetX[6] = {0,1,1,0,0,1};
int offsetY[6] = {0,0,1,0,1,1};

void main()
{
	GlobInfo Consts;
	Consts.offset = vec2(0.0,0.0);
	Consts.boxSize = vec2(20.0,20.0);
	Consts.boxMargin = vec2(5.0,5.0);
	Consts.counts = ivec2(5,5);

	uint blockId = gl_VertexID % 6;

	uint row = blockId % Consts.counts.x;
	uint column = blockId / Consts.counts.y;

	vec2 offset = Consts.offset + vec2(row,column)*(Consts.boxSize + Consts.boxMargin);

	offset += Consts.boxSize*vec2(offsetX[blockId],offsetY[blockId]);

	FragColor = vec4(1.0,1.0,1.0,1.0);
	gl_Position = vec4(offset,0.0,1.0);
}
