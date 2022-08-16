use bevy::utils::label::DynHash;
use bevy::{prelude::*, window::WindowId};

use raw_window_handle::RawWindowHandle;
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
            let document = ws_window.document().unwrap();
            let html_doc = document.dyn_into::<web_sys::HtmlCanvasElement>().unwrap();
        }
    }
}
