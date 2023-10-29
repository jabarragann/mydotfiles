# Notes about prompt generation

The prompt is set up to automatically display the ros distribution if available with the `get_ros_distro()` function. To make this work I have to re source the prompt after loading ros. The resourcing action happens inside the bash function that loads ros packages. The might be a better way to achieve this.
 
