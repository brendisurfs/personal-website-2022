use bevy::prelude::*;

use raw_window_handle::WebWindowHandle;
use wasm_bindgen::JsCast;
use web_sys::HtmlCanvasElement;

#[derive(Default)]
pub struct CanvasPlugin;

impl Plugin for CanvasPlugin {
    fn build(&self, app: &mut App) {
        let window_descriptor = app
            .world
            .get_resource::<WindowDescriptor>()
            .expect("could not get window resource")
            .clone();

        let mut windows = app
            .world
            .get_resource_mut::<Windows>()
            .expect("could not get mut resource from world");

        let handle = WebWindowHandle::empty();

        if let Some(raw_handle) = window_descriptor.canvas {
            // let id = raw_handle.parse().unwrap();

            let ws_window = web_sys::window().unwrap();
            let canvas: HtmlCanvasElement = ws_window
                .document()
                .unwrap()
                .query_selector(&format!("[data-raw-handle=1]"))
                .unwrap()
                .unwrap()
                .dyn_into()
                .unwrap();

            canvas.set_width(window_descriptor.width as _);
            canvas.set_height(window_descriptor.height as _);
        }

        let width: f32 = window_descriptor.width as _;
        let height: f32 = window_descriptor.height as _;
    }
}
