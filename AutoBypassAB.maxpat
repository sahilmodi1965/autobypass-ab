{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 6,
			"revision" : 2,
			"architecture" : "x64",
			"modernui" : 1
		},
		"classnamespace" : "box",
		"rect" : [ 100.0, 100.0, 520.0, 520.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 320.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [
			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 30.0, 30.0, 60.0, 22.0 ],
					"text" : "plugin~"
				}
			},
			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 450.0, 68.0, 22.0 ],
					"text" : "plugout~ 2"
				}
			},
			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 150.0, 30.0, 100.0, 22.0 ],
					"text" : "live.thisdevice"
				}
			},
			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 150.0, 330.0, 120.0, 22.0 ],
					"text" : "js ab_bypass.js",
					"saved_object_attributes" : 					{
						"filename" : "ab_bypass.js",
						"parameter_enable" : 0
					}
				}
			},
			{
				"box" : 				{
					"id" : "obj-scan",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 30.0, 90.0, 80.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 10.0, 10.0, 70.0, 22.0 ],
					"text" : "Scan",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enable" : 0
						}
					}
				}
			},
			{
				"box" : 				{
					"id" : "obj-mscan",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 30.0, 130.0, 50.0, 22.0 ],
					"text" : "scan"
				}
			},
			{
				"box" : 				{
					"id" : "obj-ab",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 130.0, 90.0, 110.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 90.0, 10.0, 140.0, 40.0 ],
					"text" : "A / B",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enable" : 0
						}
					}
				}
			},
			{
				"box" : 				{
					"id" : "obj-mab",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 130.0, 140.0, 40.0, 22.0 ],
					"text" : "ab"
				}
			},
			{
				"box" : 				{
					"id" : "obj-all",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 260.0, 90.0, 60.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 240.0, 10.0, 55.0, 22.0 ],
					"text" : "All",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enable" : 0
						}
					}
				}
			},
			{
				"box" : 				{
					"id" : "obj-mall",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 260.0, 130.0, 60.0, 22.0 ],
					"text" : "selall"
				}
			},
			{
				"box" : 				{
					"id" : "obj-none",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 330.0, 90.0, 60.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 300.0, 10.0, 55.0, 22.0 ],
					"text" : "None",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enable" : 0
						}
					}
				}
			},
			{
				"box" : 				{
					"id" : "obj-mnone",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 330.0, 130.0, 70.0, 22.0 ],
					"text" : "clearall"
				}
			},
			{
				"box" : 				{
					"id" : "obj-menu",
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 30.0, 200.0, 360.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 10.0, 60.0, 345.0, 24.0 ],
					"types" : [  ]
				}
			},
			{
				"box" : 				{
					"id" : "obj-state",
					"maxclass" : "live.text",
					"mode" : 2,
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 30.0, 250.0, 60.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 10.0, 95.0, 60.0, 22.0 ],
					"text" : "A",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enable" : 0
						}
					}
				}
			},
			{
				"box" : 				{
					"id" : "obj-count",
					"maxclass" : "live.text",
					"mode" : 2,
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 110.0, 250.0, 180.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 80.0, 95.0, 150.0, 22.0 ],
					"text" : "0 / 0 selected",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enable" : 0
						}
					}
				}
			},
			{
				"box" : 				{
					"id" : "obj-auto",
					"maxclass" : "live.text",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 310.0, 250.0, 60.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 240.0, 60.0, 60.0, 24.0 ],
					"text" : "Auto",
					"texton" : "Auto ●",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enable" : 0
						}
					}
				}
			},
			{
				"box" : 				{
					"id" : "obj-rate",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 380.0, 250.0, 60.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 305.0, 60.0, 50.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 1000 ],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "Rate (ms)",
							"parameter_mmax" : 5000.0,
							"parameter_mmin" : 100.0,
							"parameter_shortname" : "rate ms",
							"parameter_type" : 1,
							"parameter_unitstyle" : 4
						}
					},
					"varname" : "rate_ms"
				}
			},
			{
				"box" : 				{
					"id" : "obj-metro",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 310.0, 300.0, 80.0, 22.0 ],
					"text" : "metro 1000"
				}
			},
			{
				"box" : 				{
					"id" : "obj-mauto",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 130.0, 175.0, 40.0, 22.0 ],
					"text" : "ab"
				}
			}
		],
		"lines" : [
			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-2", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-1", 1 ],
					"destination" : [ "obj-2", 1 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-mscan", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-scan", 0 ],
					"destination" : [ "obj-mscan", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-mscan", 0 ],
					"destination" : [ "obj-4", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-ab", 0 ],
					"destination" : [ "obj-mab", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-mab", 0 ],
					"destination" : [ "obj-4", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-all", 0 ],
					"destination" : [ "obj-mall", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-mall", 0 ],
					"destination" : [ "obj-4", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-none", 0 ],
					"destination" : [ "obj-mnone", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-mnone", 0 ],
					"destination" : [ "obj-4", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-menu", 0 ],
					"destination" : [ "obj-4", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-menu", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-4", 1 ],
					"destination" : [ "obj-state", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-4", 2 ],
					"destination" : [ "obj-count", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-auto", 0 ],
					"destination" : [ "obj-metro", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-rate", 0 ],
					"destination" : [ "obj-metro", 1 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-metro", 0 ],
					"destination" : [ "obj-mauto", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-mauto", 0 ],
					"destination" : [ "obj-4", 0 ]
				}
			}
		]
	}
}
