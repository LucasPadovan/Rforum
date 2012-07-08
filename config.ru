# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Animanga::Application

libdir = "bbcoder-0.1.5/lib/"
$LOAD_PATH.unshift(libdir)
