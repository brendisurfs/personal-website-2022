use bevy::{
    pbr::MaterialPipelineKey,
    prelude::{
        default, shape, App, Assets, Camera3dBundle, ClearColor, Color, Commands, Material,
        MaterialMeshBundle, MaterialPlugin, Mesh, PbrBundle, PointLight, PointLightBundle, ResMut,
        StandardMaterial, Transform, Vec3,
    },
    reflect::TypeUuid,
    render::{
        mesh::MeshVertexBufferLayout,
        render_resource::{
            AsBindGroup, RenderPipelineDescriptor, ShaderRef, SpecializedMeshPipelineError,
        },
    },
    window::WindowDescriptor,
    DefaultPlugins,
};
use web_sys::console;

fn main() {
    console::log_1(&"hello from wasm test!".into());

    App::new()
        .insert_resource(WindowDescriptor {
            width: 500.,
            height: 500.,
            canvas: Some("canvas".to_string()),
            ..default()
        })
        .insert_resource(ClearColor(Color::rgb(0., 0., 0.)))
        .add_plugins(DefaultPlugins)
        .add_plugin(MaterialPlugin::<CustomFresnelMaterial>::default())
        .add_startup_system(setup)
        .run();
}

// setup for basic 3d scene.
pub fn setup(
    mut commands: Commands,
    mut meshes: ResMut<Assets<Mesh>>,
    mut materials: ResMut<Assets<CustomFresnelMaterial>>,
) {
    // spawn cube
    commands.spawn_bundle(MaterialMeshBundle {
        mesh: meshes.add(Mesh::from(shape::Cube { size: 1.0 })),
        material: materials.add(CustomFresnelMaterial { color: Color::BLUE }),
        transform: Transform::from_xyz(0.0, 0.5, 0.0),
        ..default()
    });

    // lights
    let point_light = PointLight {
        intensity: 1500.0,
        shadows_enabled: true,
        ..default()
    };

    let pt_bundle = PointLightBundle {
        point_light,
        transform: Transform::from_xyz(4.0, 8.0, 4.0),
        ..default()
    };

    commands.spawn_bundle(pt_bundle);

    // camera
    let cam_bundle = Camera3dBundle {
        transform: Transform::from_xyz(-2., 2.5, 5.).looking_at(Vec3::ZERO, Vec3::Y),
        ..default()
    };

    commands.spawn_bundle(cam_bundle);
}

#[derive(AsBindGroup, Clone, TypeUuid)]
#[uuid = "4ee9c363-1124-4113-890e-199d81b00281"]
pub struct CustomFresnelMaterial {
    #[uniform(0)]
    color: Color,
}

impl Material for CustomFresnelMaterial {
    fn vertex_shader() -> ShaderRef {
        "shaders/fresnel_mat.vert".into()
    }
    fn fragment_shader() -> ShaderRef {
        "shaders/fresnel_mat.frag".into()
    }

    // since glsl uses main as an entry point, we override that here.
    fn specialize(
        _pipeline: &bevy::pbr::MaterialPipeline<Self>,
        descriptor: &mut RenderPipelineDescriptor,
        _layout: &MeshVertexBufferLayout,
        _key: MaterialPipelineKey<Self>,
    ) -> Result<(), SpecializedMeshPipelineError> {
        descriptor.vertex.entry_point = "main".into();
        descriptor
            .fragment
            .as_mut()
            .expect("fragment to be mut")
            .entry_point = "main".into();
        Ok(())
    }
}
