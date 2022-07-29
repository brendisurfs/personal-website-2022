// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as RescriptReactRouter from "@rescript/react/lib/es6/src/RescriptReactRouter.js";

var changeUrl = RescriptReactRouter.push;

function Navbar(Props) {
  var topbarList = [
    "home",
    "about",
    "blog"
  ];
  var navItems = Belt_Array.map(topbarList, (function (l) {
          return React.createElement("button", {
                      key: l,
                      onClick: (function (_e) {
                          return RescriptReactRouter.push(l);
                        })
                    }, l);
        }));
  return React.createElement("navbar", undefined, navItems);
}

var make = Navbar;

export {
  changeUrl ,
  make ,
  
}
/* react Not a pure module */