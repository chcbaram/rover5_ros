FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../src/rover5_ros/msg"
  "../src/rover5_ros/srv"
  "CMakeFiles/run_tests"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/run_tests.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
