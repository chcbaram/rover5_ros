FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../src/rover5_ros/msg"
  "../src/rover5_ros/srv"
  "CMakeFiles/ROSBUILD_gensrv_py"
  "../src/rover5_ros/srv/__init__.py"
  "../src/rover5_ros/srv/_rover5_node_cmd_pwm.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_gensrv_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
