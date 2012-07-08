require 'bbcoder/base'
require 'bbcoder/configuration'
require 'bbcoder/tag'
require 'bbcoder/buffer'
require 'bbcoder/buffer_tags'
require 'bbcoder/string'

BBCoder.configure do
  tag :p
  tag :b, :as => :strong
  tag :i, :as => :em
  tag :u
  tag :s, :as => :strike
  tag :del
  tag :ins
  tag :ol
  tag :ul
  tag :li, :parents => [:ol, :ul]
  tag :dl
  tag :dt, :parents => [:dl]
  tag :dd, :parents => [:dl]

  tag :quote do
    <<-EOS
<fieldset>
<legend>#{meta} dijo:</legend>
  <blockquote>
    #{content}
  </blockquote>
</fieldset>
    EOS
  end

  tag :code do
    <<-EOS
<div class="bbcode-code #{meta}">
  <pre>#{content}</pre>
</div>
    EOS
  end

  tag :spoiler do
    <<-EOS
<fieldset class="bbcode-spoiler">
  <legend class="bbcode-spoiler-legend">Spoiler</legend>
  <div class="bbcode-spoiler-div">#{content}</div>
</fieldset>
    EOS
  end

  tag :url do
    if meta.nil? || meta.empty?
      %(<a href="#{content}" target="blank">#{content}</a>)
    else
      %(<a href="#{meta}" target="blank">#{content}</a>)
    end
  end

  tag :img, :match => /^.*(png|bmp|jpg|gif)$/ do
    %(<img src="#{content}" />)
  end

  tag :youtube do
    <<-EOS
<iframe width="80%" height="349" src="http://www.youtube.com/embed/#{content[content.length-11..content.length]}" frameborder="0" allowfullscreen></iframe>
    EOS
  end

  tag :center do
    %(<center>#{content}</center>)
  end

end

