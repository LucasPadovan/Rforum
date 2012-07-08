# config/initializers/time_formats.rb
Time::DATE_FORMATS[:simple] = "%d/%m/%y"
Time::DATE_FORMATS[:detallada] = "%H:%M:%SHs. del %d/%m/%Y"
Time::DATE_FORMATS[:cancion] = "%H:%M:%S hs."
Time::DATE_FORMATS[:pretty] = lambda { |time| time.strftime("%a, %b %e at %l:%M") + time.strftime("%p").downcase }