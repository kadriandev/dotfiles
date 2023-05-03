"use strict";var d=Object.defineProperty;var c=Object.getOwnPropertyDescriptor;var p=Object.getOwnPropertyNames;var f=Object.prototype.hasOwnProperty;var w=(i,t)=>{for(var o in t)d(i,o,{get:t[o],enumerable:!0})},u=(i,t,o,n)=>{if(t&&typeof t=="object"||typeof t=="function")for(let r of p(t))!f.call(i,r)&&r!==o&&d(i,r,{get:()=>t[r],enumerable:!(n=c(t,r))||n.enumerable});return i};var m=i=>u(d({},"__esModule",{value:!0}),i);var g={};w(g,{default:()=>S});module.exports=m(g);var e=require("@raycast/api"),s=require("child_process"),h=()=>{let i=`
  if application "Finder" is running and frontmost of application "Finder" then
    tell app "Finder"
      set finderWindow to window 1
      set finderWindowPath to (POSIX path of (target of finderWindow as alias))
      return finderWindowPath
    end tell
  else 
    error "Could not get the selected Finder window"
  end if
 `;return new Promise((t,o)=>{let n=(0,s.exec)(`osascript -e '${i}'`,(r,a,l)=>{(r||l)&&o(Error("Could not get the selected Finder window")),t(a.trim())});n.on("close",()=>{n.kill()})})},S=async()=>{let i=(0,e.getPreferenceValues)(),o=(await(0,e.getApplications)()).find(n=>n.bundleId===i.VSCodeVariant);if(!o){await(0,e.showToast)({style:e.Toast.Style.Failure,title:"Visual Studio Code is not installed",primaryAction:{title:"Install Visual Studio Code",onAction:()=>(0,e.open)("https://code.visualstudio.com/download")},secondaryAction:{title:"Install VSCodium",onAction:()=>(0,e.open)("https://github.com/VSCodium/vscodium/releases")}});return}try{let n=await(0,e.getSelectedFinderItems)();if(n.length){for(let a of n)await(0,e.open)(a.path,o);return}let r=await h();await(0,e.open)(r,o);return}catch{await(0,e.showToast)({style:e.Toast.Style.Failure,title:"No Finder items or window selected"})}};0&&(module.exports={});
