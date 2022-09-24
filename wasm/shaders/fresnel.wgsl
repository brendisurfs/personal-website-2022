struct CustomFresnelMaterial {
  color: vec4<f32>,
}

@group(1) @binding(0)
var<uniform> material: CustomFresnelMaterial;

