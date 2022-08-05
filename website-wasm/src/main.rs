use bevy::prelude::*;

#[derive(Component)]
struct Person;

#[derive(Component)]
struct Name(String);

fn add_people(mut commands: Commands) {
    commands
        .spawn()
        .insert(Person)
        .insert(Name("Brendi".to_string()));
    commands
        .spawn()
        .insert(Person)
        .insert(Name("Matt".to_string()));
    commands
        .spawn()
        .insert(Person)
        .insert(Name("Grant".to_string()));
}

struct GreetTimer(Timer);
// Res = resource.
fn greet_people(time: Res<Time>, mut timer: ResMut<GreetTimer>, query: Query<&Name, With<Person>>) {
    if timer.0.tick(time.delta()).just_finished() {
        for name in query.iter() {
            println!("hello {}!", name.0);
        }
    }
}

// creating a Plugin for better Systems management.
pub struct HelloPlugin;

impl Plugin for HelloPlugin {
    // use from_seconds with true for repeat to repeat the timer.
    fn build(&self, app: &mut App) {
        app.insert_resource(GreetTimer(Timer::from_seconds(2.0, true)))
            .add_startup_system(add_people)
            .add_system(greet_people);
    }
}

// .add_plugin(HelloPlugin)
fn main() {
    App::new()
        .add_plugins(DefaultPlugins)
        .add_startup_system(setup)
        .run();
}

fn setup(
    mut commands: Commands,
    mut meshes: ResMut<Assets<Mesh>>,
    mut mats: ResMut<Assets<StandardMaterial>>,
) {
    // make a plane
    commands.spawn_bundle(PbrBundle {
        mesh: meshes.add(Mesh::from(shape::Plane { size: 20.0 })),
        material: mats.add(Color::rgb(1., 1., 1.).into()),
        ..default()
    });

    // make a cube
    let cube = Mesh::from(shape::Cube { size: 1.0 });
    let cube_material = StandardMaterial {
        base_color: Color::hex("ffd891").expect("could not parse hex code"),
        unlit: false,
        ..default()
    };

    let pbr_cube = PbrBundle {
        mesh: meshes.add(cube),
        material: mats.add(cube_material),
        transform: Transform::from_xyz(0.0, 0.5, 0.0),
        ..default()
    };
    commands.spawn_bundle(pbr_cube);

    // and make a light...
    let pt_light_bundle = PointLightBundle {
        transform: Transform::from_xyz(25., 25., 25.),
        point_light: PointLight {
            intensity: 70_000.,
            range: 100.,
            shadows_enabled: true,
            ..default()
        },
        ..default()
    };

    commands.spawn_bundle(pt_light_bundle);

    // ...aaaand create the camera
    let cam_bundle = Camera3dBundle {
        transform: Transform::from_xyz(0.5, 2.2, 8.0).looking_at(Vec3::ZERO, Vec3::Y),
        projection: OrthographicProjection {
            scale: 0.01,
            ..default()
        }
        .into(),
        ..default()
    };

    commands.spawn_bundle(cam_bundle);
}
