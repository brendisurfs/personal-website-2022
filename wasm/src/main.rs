use bevy::{
    prelude::{
        default, shape, App, Assets, Camera3dBundle, ClearColor, Color, Commands, Handle, Image,
        Material, MaterialMeshBundle, MaterialPlugin, Mesh, PointLight, PointLightBundle, ResMut,
        Transform, Vec3,
    },
    reflect::TypeUuid,
    render::render_resource::{AsBindGroup, ShaderRef},
    window::WindowDescriptor,
    DefaultPlugins,
};
use web_sys::console;

fn main() {
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

#[derive(AsBindGroup, Clone, TypeUuid, Debug)]
#[uuid = "f690fdae-d598-45ab-8225-97e2a3f056e0"]
pub struct CustomFresnelMaterial {
    #[uniform(0)]
    color: Color,
}

impl Material for CustomFresnelMaterial {
    fn fragment_shader() -> ShaderRef {
        "../shaders/fresnel.wgsl".into()
    }
}
