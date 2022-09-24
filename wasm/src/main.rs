use bevy::{
    prelude::{
        default, shape, App, Assets, Camera3dBundle, ClearColor, Color, Commands, Mesh, PbrBundle,
        PointLight, PointLightBundle, ResMut, StandardMaterial, Transform, Vec3,
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
            canvas: Some("#3d-canvas".to_string()),
            ..default()
        })
        .insert_resource(ClearColor(Color::rgb(1., 1., 1.)))
        .add_plugins(DefaultPlugins)
        .add_startup_system(setup)
        .run();
}

// setup for basic 3d scene.
pub fn setup(
    mut commands: Commands,
    mut meshes: ResMut<Assets<Mesh>>,
    mut materials: ResMut<Assets<StandardMaterial>>,
) {
    // spawn cube
    commands.spawn_bundle(PbrBundle {
        mesh: meshes.add(Mesh::from(shape::Cube { size: 1.0 })),
        material: materials.add(Color::BLUE.into()),
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
