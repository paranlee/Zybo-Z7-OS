# Zybo Z7 Hardware Repository

## Zybo Z7-20 Petalinux Demo

For more information on the Zybo Z7, see its [Resource Center](https://reference.digilentinc.com/reference/programmable-logic/zybo-z7/start) on the Digilent Wiki.

For more information on the Zybo Z7-20 Petalinux Demo, including setup instructions, visit its [Demo Page](https://reference.digilentinc.com/reference/programmable-logic/zybo-z7/demos/petalinux) on the Digilent Wiki.

FIXME (Note: If a wiki page for the demo does not follow this URL format, create a redirect at a page that uses this format. URLs should not end in `/start`)

For instructions on how to use this repository with git, and for additional documentation on the submodule and branch structures used, please visit [Digilent FPGA Demo Git Repositories](https://reference.digilentinc.com/reference/programmable-logic/documents/git) on the Digilent Wiki. Note that use of git is not required to use this demo. Digilent recommends the use of project releases, for which instructions can be found in the demo wiki page, linked above.

Note: If using git, while this demo only requires Vivado sources, other demos require sources for other tools. It is recommended to get these sources through the corresponding branch of the Zybo Z7 repository, as described in the Digilent FPGA Demo Git Repositories page, linked above.
-OR-
Note: If using git, as this demo requires sources for tools other than Vivado, which are provided in other repos, it is recommended to get these sources through the corresponding branch of the Zybo Z7 repository, which uses submodules to bring in sources for all tools used by this demo. This is described in the Digilent FPGA Demo Git Repositories page, linked above.

Some patches on this repository for Petalinux 2022.1 xps project build. See linked below.

- https://github.com/paranlee/Zybo-Z7-HW.git
- https://github.com/paranlee/digilent-vivado-scripts.git
- https://github.com/paranlee/vivado-library.git

Adding some patch on Zybo-Z7-HW
`commit 89b4a8e5f9f6f1579cb4768a9aeff0f3640093b9 (HEAD -> 20/Petalinux/master, origin/20/Petalinux/master)`

```
[submodule "scripts"]
	path = scripts
	url = https://github.com/Digilent/digilent-vivado-scripts.git
[submodule "repo/vivado-library"]
	path = repo/vivado-library
	url = https://github.com/Digilent/vivado-library.git
```

```patch
diff --git a/project_info.tcl b/project_info.tcl
index 7e2fdd4..4e15fa7 100644
--- a/project_info.tcl
+++ b/project_info.tcl
@@ -2,7 +2,7 @@
 proc set_project_properties_post_create_project {proj_name} {
     set project_obj [get_projects $proj_name]
     set_property "part" "xc7z020clg400-1" $project_obj
-    set_property "board_part" "digilentinc.com:zybo-z7-20:part0:1.1" $project_obj
+    #set_property "board_part" "digilentinc.com:zybo-z7-20:part0:1.1" $project_obj
     set_property "default_lib" "xil_defaultlib" $project_obj
     set_property "simulator_language" "Mixed" $project_obj
     set_property "target_language" "VHDL" $project_obj
diff --git a/scripts b/scripts
--- a/scripts
+++ b/scripts
@@ -1 +1 @@
-Subproject commit ba6bbb948f13805db6172d3e04749671e685c9da
+Subproject commit ba6bbb948f13805db6172d3e04749671e685c9da-dirty
diff --git a/src/bd/system.tcl b/src/bd/system.tcl
index 9869e23..e08c7ef 100644
--- a/src/bd/system.tcl
+++ b/src/bd/system.tcl
@@ -301,9 +301,12 @@ proc create_root_design { parentCell } {
   # Create instance: axi_gpio_led, and set properties
   set axi_gpio_led [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio axi_gpio_led ]
   set_property -dict [ list \
+   CONFIG.C_DOUT_DEFAULT {0x00000000} \
    CONFIG.C_GPIO_WIDTH {4} \
-   CONFIG.GPIO_BOARD_INTERFACE {leds_4bits} \
-   CONFIG.USE_BOARD_FLOW {true} \
+   CONFIG.C_TRI_DEFAULT {0xFFFFFFFF} \
+   CONFIG.NUM_PORTS {4} \
+   # CONFIG.GPIO_BOARD_INTERFACE {leds_4bits} \
+   # CONFIG.USE_BOARD_FLOW {true} \
  ] $axi_gpio_led
 
   # Create instance: axi_gpio_sw_btn, and set properties
@@ -314,8 +317,8 @@ proc create_root_design { parentCell } {
    CONFIG.C_GPIO2_WIDTH {4} \
    CONFIG.C_GPIO_WIDTH {4} \
    CONFIG.C_IS_DUAL {1} \
-   CONFIG.GPIO2_BOARD_INTERFACE {btns_4bits} \
-   CONFIG.GPIO_BOARD_INTERFACE {sws_4bits} \
+   # CONFIG.GPIO2_BOARD_INTERFACE {btns_4bits} \
+   # CONFIG.GPIO_BOARD_INTERFACE {sws_4bits} \
    CONFIG.USE_BOARD_FLOW {true} \
  ] $axi_gpio_sw_btn
```

Adding some patch on scripts
`commit ba6bbb948f13805db6172d3e04749671e685c9da (HEAD, tag: v2023.1, tag: v2022.1-1, origin/master, origin/feature/v2022.1, origin/HEAD, master)`

```
diff --git a/git_vivado.py b/git_vivado.py
index 45e33da..3f62c0f 100644
--- a/git_vivado.py
+++ b/git_vivado.py
@@ -199,6 +199,7 @@ if __name__ == "__main__":
     
     if hasattr(args, 'version'):
         funcargs['vivado_cmd'] = os.path.join(os.path.abspath(config_settings['VivadoInstallPath']), args.version, 'bin', 'vivado')
+        funcargs['vivado_cmd'] = "/tools/Xilinx/Vivado/2022.1/bin/vivado" # `which vivado`
         funcargs['version'] = args.version
         if not os.path.isfile(funcargs['vivado_cmd']):
             print('Error: Vivado not installed at %s' % funcargs['vivado_cmd'])
```